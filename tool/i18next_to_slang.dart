import 'dart:convert';
import 'dart:io';

const _cldrSuffixes = {'zero', 'one', 'two', 'few', 'many', 'other'};
const _inputDir = 'lib/i18n';
const _outputDir = 'lib/i18n/generated';
const _inputSuffix = '.i18next.json';
const _outputSuffix = '.i18n.json';

void main() {
  final outDir = Directory(_outputDir);
  if (outDir.existsSync()) {
    for (final entity in outDir.listSync()) {
      if (entity is File && entity.path.endsWith(_outputSuffix)) {
        entity.deleteSync();
      }
    }
  } else {
    outDir.createSync(recursive: true);
  }

  final inDir = Directory(_inputDir);
  var count = 0;
  for (final entity in inDir.listSync().whereType<File>()) {
    final name = entity.uri.pathSegments.last;
    if (!name.endsWith(_inputSuffix)) continue;
    _convert(entity, outDir);
    count++;
  }
  stdout.writeln('Converted $count file(s) to $_outputDir/');
}

void _convert(File input, Directory outDir) {
  final locale = input.uri.pathSegments.last
      .substring(0, input.uri.pathSegments.last.length - _inputSuffix.length);
  final data = jsonDecode(input.readAsStringSync()) as Map<String, dynamic>;

  final result = <String, dynamic>{};
  final plurals = <String, Map<String, String>>{};

  for (final entry in data.entries) {
    final value = _rewriteInterpolation(entry.value as String);
    final split = _splitCldrSuffix(entry.key);
    if (split == null) {
      result[entry.key] = value;
    } else {
      plurals.putIfAbsent(split.base, () => {})[split.form] = value;
    }
  }

  for (final entry in plurals.entries) {
    result['${entry.key}(param=count)'] = entry.value;
  }

  final outPath = '${outDir.path}/$locale$_outputSuffix';
  File(outPath).writeAsStringSync(
    '${const JsonEncoder.withIndent('  ').convert(result)}\n',
  );
  stdout.writeln('  $locale (${data.length} keys -> ${result.length} entries)');
}

/// Returns `(base, form)` when `key` ends in an underscore-separated CLDR
/// plural suffix, otherwise `null`.
({String base, String form})? _splitCldrSuffix(String key) {
  final idx = key.lastIndexOf('_');
  if (idx <= 0) return null;
  final suffix = key.substring(idx + 1);
  if (!_cldrSuffixes.contains(suffix)) return null;
  return (base: key.substring(0, idx), form: suffix);
}

/// `{{name}}` (i18next) -> `{name}` (slang).
String _rewriteInterpolation(String value) => value.replaceAllMapped(
      RegExp(r'\{\{\s*(\w+)\s*\}\}'),
      (m) => '{${m[1]}}',
    );
