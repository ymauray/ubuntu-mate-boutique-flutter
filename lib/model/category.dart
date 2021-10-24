import 'dart:collection';

import 'package:softwareboutique/main.dart';
import 'package:softwareboutique/model/package.dart';

class Category {
  Category(this.name, Map<String, dynamic> json) : _packages = json.entries.map((e) => Package(e.value)).toList();

  final String name;
  final List<Package> _packages;

  List<Package> get packages => UnmodifiableListView(
        _packages.where((p) => p.releases.contains(systemInfo.codeName)).toList()..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase())),
      );
}
