import 'dart:convert';
import 'dart:io';

const _sourceDirectory = 'lib/i18n';
const _sourceExtension = '.i18next.json';
const _outResDirectory = 'android/app/src/main/res';
const _cldrSuffixes = {'zero', 'one', 'two', 'few', 'many', 'other'};

const _keyMap = {
  'onHrtForDays': 'on_hrt_for_days',
  'onHrtForWeeks': 'on_hrt_for_weeks',
  'onHrtForMonths': 'on_hrt_for_months',
  'onHrtForYears': 'on_hrt_for_years',
};

void main() {
  final sourceDirectory = Directory(_sourceDirectory);
  var localeCount = 0;

  for (final file in sourceDirectory.listSync().whereType<File>()) {
    final fileName = file.uri.pathSegments.last;
    if (!fileName.endsWith(_sourceExtension)) continue;
    final locale =
        fileName.substring(0, fileName.length - _sourceExtension.length);
    if (_writeLocalePlurals(file, locale)) localeCount++;
  }
  stdout.writeln('Generated widget plurals for $localeCount locale(s).');
}

bool _writeLocalePlurals(File sourceFile, String locale) {
  final data =
      jsonDecode(sourceFile.readAsStringSync()) as Map<String, dynamic>;

  final buckets = <String, Map<String, String>>{};
  for (final entry in data.entries) {
    final splittedEntry = _split(entry.key);
    if (splittedEntry == null) continue;
    if (!_keyMap.containsKey(splittedEntry.base)) continue;
    buckets.putIfAbsent(splittedEntry.base, () => {})[splittedEntry.form] =
        _androidEscapedValue(entry.value as String);
  }
  if (buckets.isEmpty) return false;

  final buffer = StringBuffer()
    ..writeln('<?xml version="1.0" encoding="utf-8"?>')
    ..writeln('<resources>');
  for (final base in _keyMap.keys) {
    final forms = buckets[base];
    if (forms == null) continue;
    buffer.writeln('    <plurals name="${_keyMap[base]}">');
    for (final form in forms.entries) {
      buffer
          .writeln('        <item quantity="${form.key}">${form.value}</item>');
    }
    buffer.writeln('    </plurals>');
  }
  buffer.writeln('</resources>');

  final directories = <String>{_valuesDirName(locale)};
  if (locale == 'en') directories.add('values');
  for (final dirName in directories) {
    final dir = Directory('$_outResDirectory/$dirName');
    dir.createSync(recursive: true);
    File('${dir.path}/widget_plurals.xml').writeAsStringSync('$buffer');
  }
  return true;
}

({String base, String form})? _split(String key) {
  final idx = key.lastIndexOf('_');
  if (idx <= 0) return null;
  final suffix = key.substring(idx + 1);
  if (!_cldrSuffixes.contains(suffix)) return null;
  return (base: key.substring(0, idx), form: suffix);
}

String _valuesDirName(String locale) {
  final parts = locale.split('-');
  if (parts.length == 1) return 'values-${parts[0]}';
  return 'values-${parts[0]}-r${parts[1]}';
}

String _androidEscapedValue(String v) => v
    .replaceAll('&', '&amp;')
    .replaceAll(RegExp(r'\{\{\s*count\s*\}\}'), '%d')
    .replaceAll("'", "\\'")
    .replaceAll('"', '\\"');
