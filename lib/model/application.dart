import 'dart:collection';

import 'package:softwareboutique/model/category.dart';

class Applications {
  Applications(Map<String, dynamic> json) : _categories = json.entries.map((e) => Category(e.key, e.value)).toList();

  final List<Category> _categories;

  List<Category> get categories => UnmodifiableListView(_categories);
}
