import 'package:swagger_built_value/swagger_built_value.dart';

class SwaggerEndpoint {
  final String path;
  final String method;
  final Map<String, dynamic> rawDefinitions;

  SwaggerEndpoint(
    this.path,
    this.method,
    this.rawDefinitions,
  );

  String get summary => rawDefinitions['summary'];
  String get description => rawDefinitions['description'];
  String get name {
    final id = rawDefinitions['operationId'];
    if (id != null) return id;

    return method + toCamelCase(path.replaceAll('/', ''));
  }

  List<String> get consumes => rawDefinitions['consumes'];
  List<String> get produces => rawDefinitions['produces'];

  List<Map<String, dynamic>> get _parameters => rawDefinitions['parameters'];
  Map<String, dynamic> get _responses => rawDefinitions['responses'];
  Map<String, dynamic> get _body => rawDefinitions['requestBody'];

  bool get hasBody => rawDefinitions.containsKey('requestBody');
  bool get hasParameters => rawDefinitions.containsKey('parameters');

  List<SwaggerParameter> getParameters() => _parameters.map((param) {
        SwaggerType type;
        final name = param['name'];
        if (param.containsKey('schema')) {
          type = parseType(param['schema']);
        } else {
          type = parseType(param);
        }

        return SwaggerParameter(
          name,
          type,
          required: param['required'] == true,
          inHeader: param['in'] == 'header',
          inPath: param['in'] == 'path',
        );
      }).toList();

  SwaggerResponse getResponse() {
    SwaggerType type;

    if (_responses.containsKey('200')) {
      if (_responses['200'].containsKey('schema')) {
        type = parseType(_responses['200']['schema']);
      } else {
        type = parseType(_responses['200']);
      }
    }

    return SwaggerResponse(type: type);
  }
}

class SwaggerResponse {
  final SwaggerType type;

  SwaggerResponse({this.type});

  bool get isVoid => type == null;
}

class SwaggerRequestBody {
  final SwaggerType type;

  SwaggerRequestBody(this.type);
}

class SwaggerParameter {
  final String name;
  final SwaggerType type;

  final bool required;
  final bool inPath;
  final bool inHeader;

  SwaggerParameter(
    this.name,
    this.type, {
    this.required = false,
    this.inPath = false,
    this.inHeader = false,
  });
}

class SwaggerApiDocument extends SwaggerDocument {
  SwaggerApiDocument(Map<String, dynamic> rawDefinitions)
      : super(rawDefinitions);

  Map<String, dynamic> get _paths => rawDefinitions['paths'];

  List<SwaggerEndpoint> getPaths() {
    final list = <SwaggerEndpoint>[];
    _paths.forEach((p, def) {
      def.forEach((method, d) {
        list.add(SwaggerEndpoint(p, method, def));
      });
    });
    return list;
  }
}
