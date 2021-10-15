import 'package:flutter/material.dart';
import 'package:softwareboutique/software_boutique_app.dart';
import 'package:window_size/window_size.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setWindowMinSize(const Size(1280 + 52, 720 + 99));
  runApp(const SoftwareBoutiqueApp());
}
