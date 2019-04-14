import 'dart:async';
import 'dart:convert';

import 'package:build/build.dart';
import 'package:dart_style/dart_style.dart';
import 'package:swagger_built_value/src/types.dart';
import 'package:swagger_built_value/src/utils.dart';

import 'parser.dart';
import 'yaml.dart';

class SwaggerBuiltValueBuilder implements Builder {
  final BuilderOptions options;

  SwaggerBuiltValueBuilder(this.options);

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final inputId = buildStep.inputId;
    final contents = await buildStep.readAsString(inputId);

    Map<String, dynamic> definitions;

    if (inputId.extension == '.yaml' || inputId.extension == '.yml') {
      definitions = parseYaml(contents);
    } else if (inputId.extension == '.json') {
      definitions = jsonDecode(contents);
    }

    final version = definitions['openapi'] ?? definitions['swagger'];
    if (version == null) return;
    if (!version.startsWith('3')) {
      throw 'Version $version not supported';
    }

    final outputId = inputId.addExtension('.built.dart');

    await buildStep.writeAsString(
      outputId,
      _generate(inputId, outputId, definitions),
    );
  }

  String _generate(
      AssetId inputId, AssetId outputId, Map<String, dynamic> definitions) {
    final doc = SwaggerDocument(definitions);

    final library = inputId.uri.path
        .split('/')
        .last
        .split('.')
        .first
        .replaceAll(' ', '_')
        .replaceAll('-', '_');

    final filename =
        outputId.path.split('/').last.replaceAll('.dart', '.g.dart');
    var sb = StringBuffer();

    sb.writeln('library $library;');
    sb.writeln('');
    sb.writeln('import \'package:built_value/built_value.dart\';');
    sb.writeln('import \'package:built_value/serializer.dart\';');
    sb.writeln('import \'package:built_collection/built_collection.dart\';');
    sb.writeln('');
    sb.writeln('part \'$filename\';');

    sb.writeln('');
    if (doc.title != null) {
      sb.writeln('/// ${doc.title}');
    }
    if (doc.version != null) {
      sb.writeln('/// ${doc.version}');
    }
    if (doc.description != null) {
      sb.writeln('/// ${doc.description}');
    }
    if (doc.terms != null) {
      sb.writeln('/// Terms: ${doc.terms}');
    }
    doc.contact?.forEach((name, val) {
      sb.writeln('/// $name: $val');
    });
    if (doc.license?.values?.isNotEmpty == true) {
      sb.writeln('/// ${doc.license.values.join(', ')}');
    }

    doc.getComponents().forEach((def) {
      sb.writeln('');
      if (def is SwaggerSchema) {
        if (def.isEnum) {
          sb = buildEnum(def.getEnum(), sb);
        } else {
          sb = buildSchema(def, sb);
        }
      }
    });

    return DartFormatter().format(sb.toString());
  }

  StringBuffer buildProperty(SwaggerProperty property, SwaggerType type,
      [StringBuffer sb]) {
    final description = property.description;

    sb ??= StringBuffer();

    sb.writeln('');
    if (description != null) {
      sb.writeln('  /// $description');
    }
    if (type is SwaggerEnum) {
      sb.writeln('  /// Enum: ${type.values.join(", ")}');
    }
    if (!property.required) {
      sb.writeln('  @nullable');
    }

    sb.writeln('  $type get ${property.name};');

    return sb;
  }

  StringBuffer buildSchema(SwaggerSchema schema, [StringBuffer sb]) {
    final description = schema.description;
    final className = capitalize(schema.className);
    final builderName = '${className}Builder';
    final serializerName = '_\$${withFirstCharInLower(className)}Serializer';

    sb ??= StringBuffer();

    if (description != null) {
      sb.writeln('  /// $description');
    }
    sb.writeln(
      'abstract class $className implements Built<$className, $builderName> {',
    );

    schema.getProperties().forEach((prop) {
      final type = prop.getType();
      sb = buildProperty(prop, type, sb);
    });

    sb.writeln('');
    sb.writeln('  $className._();');
    sb.writeln(
      '  factory $className([updates($builderName b)]) = _\$$className;',
    );
    sb.writeln(
      '  static Serializer<$className> get serializer => $serializerName;',
    );

    sb.writeln('}');

    return sb;
  }

  @override
  final buildExtensions = const {
    '.yaml': ['.yaml.built.dart'],
    '.yml': ['.yml.built.dart'],
    '.json': ['.json.built.dart'],
  };

  StringBuffer buildEnum(SwaggerEnum enumType, StringBuffer sb) {
    final lowerCaseName = withFirstCharInLower(enumType.name);
    sb.writeln('class ${enumType.name} extends EnumClass {');

    sb.writeln(
      '  static Serializer<${enumType.name}> get serializer => _\$${lowerCaseName}Serializer;',
    );

    sb.writeln('');

    enumType.values.forEach((val) {
      sb.writeln('  static const ${enumType.name} $val = _\$$val;');
    });

    sb.writeln('');

    sb.writeln('  const ${enumType.name}._(String name) : super(name);');

    sb.writeln(
      '  static BuiltSet<${enumType.name}> get values => _\$${lowerCaseName}values;',
    );
    sb.writeln(
      '  static ${enumType.name} valueOf(String name) => _\$valueOf${enumType.name}(name);',
    );

    sb.writeln('}');

    return sb;
  }
}
