final RegExp _camelCaseSpliter = new RegExp('[A-Z]|[0-9]+');
const String _snakeCaseSeparator = '_';
const String _kebabCaseSeparator = '-';

String capitalize(String val) =>
    val.substring(0, 1).toUpperCase() + val.substring(1);

String withFirstCharInLower(String val) =>
    val.substring(0, 1).toLowerCase() + val.substring(1);

String _toCamelCaseFromSeparator(String str, String separator) =>
    withFirstCharInLower(str.split(separator).map(capitalize).join());

Iterable<String> splitCamelCase(String str) => str
    .replaceAllMapped(_camelCaseSpliter, (match) => ' ${match.group(0)}')
    .trim()
    .split(' ');

String toCamelCase(String input) =>
    _toCamelCaseFromSeparator(input, _snakeCaseSeparator);

String toSnakeCase(String input) =>
    splitCamelCase(input).map((s) => s.toLowerCase()).join(_snakeCaseSeparator);

String toKebabCase(String input) => splitCamelCase(input)
    .map((s) => s.toLowerCase())
    .join(_kebabCaseSeparator)
    .replaceAll(_snakeCaseSeparator, _kebabCaseSeparator);
