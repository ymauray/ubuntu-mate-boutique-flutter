import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:softwareboutique/model/system_info.dart';
import 'package:softwareboutique/software_boutique_app.dart';
import 'package:softwareboutique/util/logger.dart';
import 'package:window_size/window_size.dart';

Future<SystemInfo> readSystemInfo() async {
  var result = await Process.run('lsb_release', ['-is', '-rs', '-cs']);
  var lines = (result.stdout as String).trim().split('\n');

  var distro = lines[0].toLowerCase();
  var osVersion = lines[1].toLowerCase();
  var codeName = lines[2].toLowerCase();
  var desktop = Platform.environment['XDG_CURRENT_DESKTOP']?.toLowerCase() ?? '';
  var isSnap = kDebugMode ? false : Platform.environment['SNAP']?.isNotEmpty ?? false;

  String? dataPath;

  /// Check folder below current working directory.
  var curentFolder = Directory.current.absolute;
  var data = Directory(curentFolder.path + '/data');
  if (data.existsSync()) {
    logger.i('Using relative path for data source. Non-production testing.');
    dataPath = data.path;
  }

  /// If local folder was not found, check SNAP location
  if ((dataPath == null) && isSnap) {
    data = Directory(Platform.environment['SNAP']! + '/usr/share/ubuntu-mate-welcome');
    if (data.existsSync()) {
      logger.i('Using ${data.path} path.');
    }
  }

  /// If no data folder was found, exit.
  if (dataPath == null) {
    logger.e('Unable to source the Software Boutique data directory.');
    exit(-1);
  }

  return SystemInfo(
    distro: distro,
    osVersion: osVersion,
    codeName: codeName,
    desktop: desktop,
    isSnap: isSnap,
    dataPath: dataPath,
  );
}

late SystemInfo systemInfo;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  systemInfo = await readSystemInfo();
  setWindowMinSize(const Size(960 + 52, 640 + 99));
  runApp(const SoftwareBoutiqueApp());
}
