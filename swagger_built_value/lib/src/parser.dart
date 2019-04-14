import 'utils.dart';
import 'types.dart';

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

  SwaggerType getType() => parseType(
        rawDefinitions,
        documentRef: documentRef,
      );
}

abstract class SwaggerComponent {
  final Map<String, dynamic> rawDefinitions;
  final String className;
  final SwaggerDocument documentRef;

  String get id => rawDefinitions['id'];
  String get description => rawDefinitions['description'];

  List<String> get requiredProperties =>
      rawDefinitions['required']?.cast<String>() ?? <String>[];

  SwaggerComponent(
    this.rawDefinitions,
    this.className,
    this.documentRef,
  );
}

class SwaggerSchema extends SwaggerComponent {
  SwaggerSchema(
    Map<String, dynamic> rawDefinitions,
    String className,
    SwaggerDocument documentRef,
  ) : super(
          rawDefinitions,
          className,
          documentRef,
        );

  bool get isEnum => _isEnum(rawDefinitions);

  SwaggerEnum getEnum() => SwaggerEnum(
        className,
        values: _enumValues(rawDefinitions),
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

class SwaggerRequestBody extends SwaggerComponent {
  SwaggerRequestBody(
    Map<String, dynamic> rawDefinitions,
    String className,
    SwaggerDocument documentRef,
  ) : super(
          rawDefinitions,
          className,
          documentRef,
        );

  bool get required => rawDefinitions['required'] == true;

  SwaggerType getType() {
    final content = rawDefinitions['content'];
    if (content.containKey('application/json')) {
      return parseType(content['application/json']);
    } else {
      // TODO support more content type
      throw 'content type for $className not supported';
    }
  }
}

class SwaggerDocument {
  final Map<String, dynamic> rawDefinitions;

  Map<String, dynamic> get infos =>
      rawDefinitions['info'] ?? <String, dynamic>{};

  SwaggerDocument(this.rawDefinitions);

  Map<String, dynamic> get _components => rawDefinitions['components'];

  List<SwaggerComponent> getComponents() {
    final defs = <SwaggerComponent>[];

    if (_components.containsKey('schemas')) {
      _components['schemas'].forEach((name, def) {
        defs.add(SwaggerSchema(def, name, this));
      });
    }

    if (_components.containsKey('requestBodies')) {
      _components['requestBodies'].forEach((name, def) {
        defs.add(SwaggerRequestBody(def, name, this));
      });
    }

    return defs;
  }

  String get description => infos['description'];
  String get version => infos['version'];
  String get title => infos['title'];
  String get terms => infos['termsOfService'];
  Map<String, String> get contact =>
      infos['contact'].cast<String, String>() ?? <String, String>{};
  Map<String, String> get license =>
      infos['license'].cast<String, String>() ?? <String, String>{};
}

List<String> _enumValues(Map<String, dynamic> defs) =>
    defs['enum']?.cast<String>() ?? <String>[];

bool _isEnum(Map<String, dynamic> defs) => defs.containsKey('enum');

SwaggerType _parseString(
  Map<String, dynamic> defs,
) =>
    _isEnum(defs)
        ? SwaggerEnum(
            'String',
            values: _enumValues(defs),
          )
        : SwaggerString(
            isBase64: defs['format'] == 'byte',
            isBinary: defs['format'] == 'binary',
            isDate: defs['format'] == 'date' || defs['format'] == 'date-time',
          );

SwaggerInteger _parseInteger(Map<String, dynamic> defs) => SwaggerInteger(
      isInt64: defs['format'] == 'int64',
      defaultValue: defs['default'] ?? 0,
    );

SwaggerArray _parseArray(
  Map<String, dynamic> defs,
  SwaggerDocument documentRef,
) {
  final items = defs['items'];
  final itemsType = items['type'];
  final itemsRef = items['\$ref'];

  if (itemsType != null) {
    return SwaggerArray(parseType(
      items,
      documentRef: documentRef,
    ));
  } else if (itemsRef != null) {
    return SwaggerArray(_resolveRef(itemsRef, documentRef));
  }
  throw "Array items not found $defs";
}

SwaggerType _resolveRef(String ref, SwaggerDocument documentRef) {
  if (ref.startsWith('#')) {
    final paths = ref.replaceFirst('#', '').split('/');
    var current;
    String name;
    for (var i = 0; i < paths.length; i++) {
      name = paths[i];
      if (current == null) {
        current = documentRef.rawDefinitions[name];
      } else {
        current = current[name];
      }
    }

    SwaggerSchema schema = SwaggerSchema(
      current,
      name,
      documentRef,
    );

    return SwaggerReference(schema.className);
  }
  throw 'Reference $ref unsupported';
}

SwaggerNumber _parseNumber(Map<String, dynamic> defs) => SwaggerNumber(
      defaultValue: defs['default'] ?? 0.0,
    );

SwaggerBool _parseBool(Map<String, dynamic> defs) => SwaggerBool(
      defaultValue: defs['default'] ?? false,
    );

SwaggerType parseType(
  Map<String, dynamic> defs, {
  SwaggerDocument documentRef,
}) {
  final type = defs['type'];
  final ref = defs['\$ref'];
  if (type == null && ref != null) {
    return _resolveRef(ref, documentRef);
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
      return _parseArray(defs, documentRef);
    default:
      throw '$type: unsupported';
  }
}
