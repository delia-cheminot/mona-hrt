import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

class UpdateService {
  static const String _releaseUrl = 'https://api.github.com/repos/delia-cheminot/mona-hrt/releases/latest';

    Future<Map<String, dynamic>?> _fetchLatestRelease() async {
      final response = await http.get(Uri.parse(_releaseUrl));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      return null;
    }

    Future<bool> isUpdateAvailable() async {
      if (!Platform.isAndroid) return false;
      try {
        final packageInfo = await PackageInfo.fromPlatform();
        final data = await _fetchLatestRelease();

        if (data != null) {
          final latestVersion = data['tag_name'].toString().replaceAll('v', '');
          return packageInfo.version != latestVersion;
        }
      } catch (e) {
        // Silently fail for background checks
      }
      return false;
    }

    Future<void> checkForUpdates(BuildContext context) async {
      if (!Platform.isAndroid) return;

      try {
        final packageInfo = await PackageInfo.fromPlatform();
        final currentVersion = packageInfo.version;

        final data = await _fetchLatestRelease();

        if (data != null) {
          final latestVersion = data['tag_name'].toString().replaceAll('v', '');
          final assets = data['assets'] as List;

          if (!context.mounted) return;

          if (currentVersion != latestVersion) {
            final bestAsset = await _getBestAssetForDevice(assets);

            if (!context.mounted) return;

            if (bestAsset != null) {
              _showUpdateDialog(context, currentVersion, latestVersion, bestAsset);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No compatible update found for your device.')),
              );
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Your app is up to date!')),
            );
          }
        } else {
          throw Exception('Failed to fetch latest release');
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not check for updates right now.')),
          );
        }
      }
    }

  Future<Map<String, dynamic>?> _getBestAssetForDevice(List assets) async {
    final apkAssets = assets.where((a) => a['name'].toString().endsWith('.apk')).toList();
    if (apkAssets.isEmpty) return null;

    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;
    final supportedAbis = androidInfo.supportedAbis;

    for (String abi in supportedAbis) {
      for (var asset in apkAssets) {
        if (asset['name'].toString().toLowerCase().contains(abi.toLowerCase())) {
          return asset;
        }
      }
    }

    final universalAssets = apkAssets.where((a) {
      final name = a['name'].toString().toLowerCase();
      return !name.contains('arm64') && !name.contains('armeabi') && !name.contains('x86');
    }).toList();

    if (universalAssets.isNotEmpty) return universalAssets.first;

    return apkAssets.first;
  }

  void _showUpdateDialog(BuildContext context, String current, String latest, Map<String, dynamic> asset) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update Available'),
        content: Text('Version $latest is available! (Current: $current)\n\nAn update compatible with your device is ready to be installed.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              _downloadAndInstall(context, asset['browser_download_url'], asset['name']);
            },
            child: const Text('Download & Install'),
          ),
        ],
      ),
    );
  }

  Future<void> _downloadAndInstall(BuildContext context, String url, String fileName) async {
    if (!await Permission.requestInstallPackages.request().isGranted) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Permission is required to install updates.')),
        );
      }
      return;
    }

    ValueNotifier<double> progressNotifier = ValueNotifier(0.0);

    if (context.mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text('Downloading Update...'),
          content: ValueListenableBuilder<double>(
            valueListenable: progressNotifier,
            builder: (context, progress, child) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LinearProgressIndicator(value: progress),
                  const SizedBox(height: 16),
                  Text('${(progress * 100).toStringAsFixed(1)}%'),
                ],
              );
            },
          ),
        ),
      );
    }

    try {
      final dir = await getTemporaryDirectory();
      final savePath = '${dir.path}/$fileName';

      final client = http.Client();
      final request = http.Request('GET', Uri.parse(url));
      final response = await client.send(request);

      final contentLength = response.contentLength ?? 1;
      int downloadedLength = 0;

      final file = File(savePath);
      final sink = file.openWrite();

      await response.stream.forEach((chunk) {
        sink.add(chunk);
        downloadedLength += chunk.length;
        progressNotifier.value = downloadedLength / contentLength;
      });

      await sink.close();
      client.close();

      if (context.mounted) {
        Navigator.pop(context);
      }

      final result = await OpenFilex.open(savePath);
      if (result.type != ResultType.done && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to open installer: ${result.message}')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Download failed. Please try again later.')),
        );
      }
    }
  }
}
