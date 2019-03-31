import 'package:quiver/core.dart';

abstract class SwaggerType {}

class SwaggerString implements SwaggerType {
  final bool isDate;
  final bool isBinary;
  final bool isBase64;

  SwaggerString({
    this.isDate = false,
    this.isBinary = false,
    this.isBase64 = false,
  });

  String toString() {
    if (isDate) return 'DateTime';
    if (isBinary) return 'List<int>';
    return 'String';
  }
}

class SwaggerEnum implements SwaggerType {
  final String name;
  final List<String> values;

  const SwaggerEnum(
    this.name, {
    this.values = const [],
  });

  String toString() => name;

  @override
  int get hashCode => hashObjects([name, values]);

  @override
  bool operator ==(Object other) =>
      identical(other, this) || (other is SwaggerEnum && other.name == name);
}

class SwaggerBool implements SwaggerType {
  final bool defaultValue;

  SwaggerBool({
    this.defaultValue = false,
  });

  String toString() => 'bool';
}

class SwaggerInteger implements SwaggerType {
  final bool isInt64;
  final int defaultValue;

  SwaggerInteger({
    this.isInt64 = false,
    this.defaultValue,
  });

  String toString() => 'int';
}

class SwaggerNumber implements SwaggerType {
  final double defaultValue;

  SwaggerNumber({
    this.defaultValue,
  });

  String toString() => 'double';
}

class SwaggerArray implements SwaggerType {
  final SwaggerType item;

  SwaggerArray(this.item);

  String toString() => 'BuiltList<$item>';
}

class SwaggerObject implements SwaggerType {
  final String name;

  SwaggerObject(this.name);

  String toString() => name;
}
