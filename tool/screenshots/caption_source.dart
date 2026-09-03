import 'dart:convert';
import 'dart:io';

Future<Map<String, String>> loadScreenshotCaptions(String path) async {
  final decoded =
      jsonDecode(await File(path).readAsString()) as Map<String, dynamic>;
  return decoded.map((key, value) => MapEntry(key, value as String));
}
