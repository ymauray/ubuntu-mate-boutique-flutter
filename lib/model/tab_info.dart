import 'package:flutter/material.dart';
import 'package:softwareboutique/pages/tab_page.dart';

class TabInfo {
  TabInfo({required this.label, required this.category, required this.icon, required this.description, required this.builder});

  final String label;
  final String category;
  final IconData icon;
  final String description;
  final TabPageBuilder builder;
}
