import 'package:yaml/yaml.dart';

Map<String, dynamic> _toMap(YamlMap map) {
  final m = <String, dynamic>{};
  map.forEach((k, v) {
    var val = v;
    if (v is YamlMap) {
      val = _toMap(v);
    } else if (v is YamlList) {
      val = toList(v);
    }
    m['$k'] = val;
  });
  return m;
}

List toList(YamlList list) {
  final l = [];

  list.forEach((v) {
    var val = v;
    if (v is YamlMap) {
      val = _toMap(v);
    } else if (v is YamlList) {
      val = toList(v);
    }
    l.add(val);
  });

  return l;
}

Map<String, dynamic> parseYaml(String content) => _toMap(loadYaml(content));
