part of '../ultimate_extension.dart';

extension JsonToBase64Extension<T> on Map<String, T> {
  /// Convert the map to a JSON string and then encode it to Base64.
  String toJsonAndEncode() {
    // Convert the JSON data to a string
    String jsonString = jsonEncode(this);

    // Encode the JSON string to base64
    String base64String = base64.encode(utf8.encode(jsonString));

    return base64String;
  }

  /// Convert the map to a pretty-printed JSON string.
  String prettyPrint() {
    JsonEncoder encoder =
        const JsonEncoder.withIndent('  '); // Use two spaces for indentation
    String jsonString = encoder.convert(this);
    return jsonString;
  }

  ///Add escaping characters to map
  ///  e.g  {"name": "ravi", "email": "test@yopmail.com"} ->  {\"name\":\"ravi\",\"email\":\"test@yopmail.com\"}
  String toEscapedJson() {
    return jsonEncode(this).replaceAll('"', '\\"');
  }

  /// Check if the map contains a specified key.
  bool containsKey({required String keyName}) {
    List<String> mapKeys = keys.toList();
    return mapKeys.contains(keyName);
  }

  /// Convert the map to a JSON string.

  String toStringFromJson() {
    String jsonString = jsonEncode(this);
    return jsonString;
  }
}

extension MapLoopExtension<K, V> on Map<K, V> {
  void forEachEntry(void Function(K key, V value) action) {
    forEach((key, value) {
      action(key, value);
    });
  }
}
