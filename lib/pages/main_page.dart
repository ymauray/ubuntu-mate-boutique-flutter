import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:softwareboutique/main.dart';
import 'package:softwareboutique/util/logger.dart' show logger;
import 'package:softwareboutique/widgets/main_widget.dart';
import 'package:softwareboutique/widgets/unsupported_distro.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    if ((systemInfo.distro == 'ubuntu') && (systemInfo.desktop == 'mate' || !systemInfo.isSnap)) {
      logger.i('Application is ready.');
      return const MainWidget();
    } else {
      return const UnsupportedDistro();
    }
  }
}
