import 'dart:async';
import 'dart:convert';

import 'package:build/build.dart';
import 'package:swagger_built_value/swagger_built_value.dart';

import 'parser.dart';

class SwaggerBuiltValueBuilder implements Builder {
  final BuilderOptions options;

  final enums = Set<SwaggerEnum>();

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

    final outputId = inputId.addExtension('.definition.dart');

    await buildStep.writeAsString(
      outputId,
      _generate(inputId, outputId, definitions),
    );
  }

  String _generate(
      AssetId inputId, AssetId outputId, Map<String, dynamic> definitions) {
    final doc = SwaggerApiDocument(definitions);
  }

  @override
  final buildExtensions = const {
    '.yaml': ['.yaml.definition.dart'],
    '.yml': ['.yml.definition.dart'],
    '.json': ['.json.definition.dart'],
  };
}
