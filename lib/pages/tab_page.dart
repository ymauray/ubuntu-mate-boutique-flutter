import 'package:flutter/material.dart';
import 'package:softwareboutique/model/category.dart';
import 'package:softwareboutique/model/tab_info.dart';
import 'package:softwareboutique/widgets/package_card.dart';

typedef TabPageBuilder = Widget Function(BuildContext context, TabInfo tabInfo, Category category);

class TabPage extends StatefulWidget {
  const TabPage(this.tabInfo, this.category, {Key? key}) : super(key: key);

  final TabInfo tabInfo;
  final Category category;

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  String? subCategory;

  @override
  Widget build(BuildContext context) {
    var subCategories = widget.category.packages.map((package) => package.subCategory).where((c) => c != 'null').toSet().toList()..sort();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.tabInfo.label,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(widget.tabInfo.description),
                ),
                subCategories.length <= 1
                    ? const SizedBox(width: 0)
                    : DropdownButton<String>(
                        value: subCategory,
                        items: [
                          const DropdownMenuItem(value: null, child: Text('No Filter')),
                          ...subCategories.map((e) => DropdownMenuItem(value: e, child: Text(e))),
                        ],
                        onChanged: (value) {
                          setState(() {
                            subCategory = value;
                          });
                        },
                      ),
              ],
            ),
            const Divider(
              height: 32,
            ),
            ...widget.category.packages.map((e) => PackageCard(e)),
          ],
        ),
      ),
    );
  }
}
