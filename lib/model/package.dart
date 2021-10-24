import 'dart:collection';

class Package {
  Package(this._json);

  final Map<String, dynamic> _json;

  String get name => _json['name'];
  String get img => _json['img'];
  String get description => (_json['description'] as List<dynamic>).join(' ');
  String get subCategory => _json['subcategory'];
  List<String> get releases => UnmodifiableListView((_json['releases'] as String).split(','));
}
