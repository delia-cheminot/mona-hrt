import 'dart:convert';
import 'dart:io';

const _sourceDirectory = 'lib/i18n';
const _sourceExtension = '.i18next.json';
const _outResDirectory = 'android/app/src/main/res';
const _cldrSuffixes = {'zero', 'one', 'two', 'few', 'many', 'other'};

const _pluralResourceNames = {
  'onHrtForDays': 'on_hrt_for_days',
  'onHrtForWeeks': 'on_hrt_for_weeks',
  'onHrtForMonths': 'on_hrt_for_months',
  'onHrtForYears': 'on_hrt_for_years',
  'intakesLoggedCount': 'intakes_logged_count',
};

const _stringResourceNames = {
  'HrtCounter': 'hrt_widget_title',
  'HrtCounterDescription': 'hrt_widget_description',
  'hrtWidgetPlaceholder': 'hrt_home_widget_placeholder',
  'hrtWidgetPreviewSample': 'hrt_widget_preview_sample',
  'hrtWidgetPreviewIntakeSample': 'hrt_widget_preview_intake_sample',
};

void main() {
  final sourceDirectory = Directory(_sourceDirectory);
  var localeCount = 0;

  for (final file in sourceDirectory.listSync().whereType<File>()) {
    final fileName = file.uri.pathSegments.last;
    if (!fileName.endsWith(_sourceExtension)) continue;
    final locale =
        fileName.substring(0, fileName.length - _sourceExtension.length);
    if (_writeLocaleWidgetResources(file, locale)) localeCount++;
  }
  stdout.writeln('Generated widget resources for $localeCount locale(s).');
}

bool _writeLocaleWidgetResources(File sourceFile, String locale) {
  final data =
      jsonDecode(sourceFile.readAsStringSync()) as Map<String, dynamic>;

  final pluralForms = _collectPluralForms(data);
  final strings = _collectStrings(data);
  if (pluralForms.isEmpty && strings.isEmpty) return false;

  final targetDirNames = <String>{_valuesDirName(locale)};
  if (locale == 'en') targetDirNames.add('values');

  for (final dirName in targetDirNames) {
    final dir = Directory('$_outResDirectory/$dirName')
      ..createSync(recursive: true);
    if (pluralForms.isNotEmpty) {
      File('${dir.path}/widget_plurals.xml')
          .writeAsStringSync(_buildPluralsXml(pluralForms));
    }
    if (strings.isNotEmpty) {
      File('${dir.path}/widget_strings.xml')
          .writeAsStringSync(_buildStringsXml(strings));
    }
  }
  return true;
}

Map<String, Map<String, String>> _collectPluralForms(
    Map<String, dynamic> data) {
  final forms = <String, Map<String, String>>{};
  for (final entry in data.entries) {
    final splitKey = _splitPluralKey(entry.key);
    if (splitKey == null) continue;
    if (!_pluralResourceNames.containsKey(splitKey.base)) continue;
    forms.putIfAbsent(splitKey.base, () => {})[splitKey.form] =
        _androidEscapedValue(entry.value as String);
  }
  return forms;
}

Map<String, String> _collectStrings(Map<String, dynamic> data) {
  final strings = <String, String>{};
  for (final sourceKey in _stringResourceNames.keys) {
    final value = data[sourceKey];
    if (value is! String) continue;
    strings[sourceKey] = _androidEscapedValue(value);
  }
  return strings;
}

String _buildPluralsXml(Map<String, Map<String, String>> pluralForms) {
  final buffer = StringBuffer()
    ..writeln('<?xml version="1.0" encoding="utf-8"?>')
    ..writeln('<resources>');
  for (final base in _pluralResourceNames.keys) {
    final forms = pluralForms[base];
    if (forms == null) continue;
    buffer.writeln('    <plurals name="${_pluralResourceNames[base]}">');
    for (final form in forms.entries) {
      buffer
          .writeln('        <item quantity="${form.key}">${form.value}</item>');
    }
    buffer.writeln('    </plurals>');
  }
  buffer.writeln('</resources>');
  return '$buffer';
}

String _buildStringsXml(Map<String, String> strings) {
  final buffer = StringBuffer()
    ..writeln('<?xml version="1.0" encoding="utf-8"?>')
    ..writeln('<resources>');
  for (final sourceKey in _stringResourceNames.keys) {
    final value = strings[sourceKey];
    if (value == null) continue;
    buffer.writeln(
        '    <string name="${_stringResourceNames[sourceKey]}">$value</string>');
  }
  buffer.writeln('</resources>');
  return '$buffer';
}

({String base, String form})? _splitPluralKey(String key) {
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
