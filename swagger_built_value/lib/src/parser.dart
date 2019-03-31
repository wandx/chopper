import 'types.dart';
import 'utils.dart';

class SwaggerProperty {
  final Map<String, dynamic> rawDefinitions;
  final String name;
  final String className;
  final SwaggerDocument documentRef;
  final bool required;

  SwaggerProperty(
    this.rawDefinitions,
    this.name,
    this.className,
    this.documentRef, {
    this.required = false,
  });

  String get description => rawDefinitions['description'];

  List<String> enumValues(Map<String, dynamic> defs) =>
      defs['enum']?.cast<String>() ?? <String>[];

  bool isEnum(Map<String, dynamic> defs) => defs.containsKey('enum');

  SwaggerType _parseString(Map<String, dynamic> defs) => isEnum(defs)
      ? SwaggerEnum('$className${capitalize(name)}', values: enumValues(defs))
      : SwaggerString(
          isBase64: defs['format'] == 'byte',
          isBinary: defs['format'] == 'binary',
          isDate: defs['format'] == 'date' || defs['format'] == 'date-time',
        );

  SwaggerInteger _parseInteger(Map<String, dynamic> defs) => SwaggerInteger(
        isInt64: defs['format'] == 'int64',
        defaultValue: defs['default'] ?? 0,
      );

  SwaggerArray _parseArray(Map<String, dynamic> defs) {
    final items = defs['items'];
    final itemsType = items['type'];
    final itemsRef = items['\$ref'];

    if (itemsType != null) {
      return SwaggerArray(_parseType(items));
    } else if (itemsRef != null) {
      return SwaggerArray(_resolveRef(itemsRef));
    }
    throw "Array items not found $defs";
  }

  SwaggerType _resolveRef(String ref) {
    if (ref.startsWith('#')) {
      final name = ref.replaceFirst('#', '').split('/').last;
      return SwaggerObject(name);
    }
    throw 'Reference $ref unsupported';
  }

  SwaggerNumber _parseNumber(Map<String, dynamic> defs) => SwaggerNumber(
        defaultValue: defs['default'] ?? 0.0,
      );

  SwaggerBool _parseBool(Map<String, dynamic> defs) => SwaggerBool(
        defaultValue: defs['default'] ?? false,
      );

  SwaggerType _parseType(Map<String, dynamic> defs) {
    final type = defs['type'];
    final ref = defs['\$ref'];
    if (type == null && ref != null) {
      return _resolveRef(ref);
    }
    switch (type.toLowerCase()) {
      case 'string':
        return _parseString(defs);
      case 'integer':
        return _parseInteger(defs);
      case 'number':
        return _parseNumber(defs);
      case 'boolean':
        return _parseBool(defs);
      case 'array':
        return _parseArray(defs);
      default:
        throw '$type: unsupported';
    }
  }

  SwaggerType getType() => _parseType(rawDefinitions);
}

class SwaggerDefinition {
  final Map<String, dynamic> rawDefinitions;
  final String className;
  final SwaggerDocument documentRef;

  String get id => rawDefinitions['id'];
  String get description => rawDefinitions['description'];

  List<String> get requiredProperties =>
      rawDefinitions['required']?.cast<String>() ?? <String>[];

  SwaggerDefinition(
    this.rawDefinitions,
    this.className,
    this.documentRef,
  );

  List<SwaggerProperty> getProperties() {
    final list = <SwaggerProperty>[];

    rawDefinitions['properties'].forEach((String name, def) {
      list.add(SwaggerProperty(
        def,
        name,
        className,
        documentRef,
        required: requiredProperties.contains(name),
      ));
    });

    return list;
  }
}

class SwaggerDocument {
  final Map<String, dynamic> rawDefinitions;

  SwaggerDocument(this.rawDefinitions);

  Map<String, dynamic> get definitions => <String, dynamic>{}
    ..addAll(rawDefinitions['definitions'] ?? <String, dynamic>{})
    ..addAll(rawDefinitions['models'] ?? <String, dynamic>{});

  List<SwaggerDefinition> getDefinitions() {
    final defs = <SwaggerDefinition>[];

    definitions.forEach((String name, def) {
      defs.add(SwaggerDefinition(def, name, this));
    });

    return defs;
  }
}
