import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:softwareboutique/i18n/software_boutique_localizations.dart';
import 'package:softwareboutique/model/application.dart';
import 'package:softwareboutique/model/category.dart';
import 'package:softwareboutique/widgets/tab_meta.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  String title = 'Welcome';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _readJson(),
      builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.hasData) {
          var applications = Applications(snapshot.data!);
          return DefaultTabController(
            length: tabMeta.length,
            child: Builder(
              builder: (context) {
                final TabController tabController = DefaultTabController.of(context)!;
                tabController.addListener(() {
                  if (!tabController.indexIsChanging) {
                    // Your code goes here.
                    // To get index of current tab use tabController.index
                    setState(() {
                      title = tabMeta[tabController.index].label;
                    });
                  }
                });
                return Scaffold(
                  appBar: AppBar(
                    title: Text(context.t(title)),
                    actions: [
                      AppBarIcon(FontAwesomeIcons.clone, tooltip: context.t('Bulk Queue')),
                      AppBarIcon(FontAwesomeIcons.search, tooltip: context.t('Search')),
                      AppBarIcon(FontAwesomeIcons.newspaper, tooltip: context.t('Boutique News')),
                      AppBarIcon(FontAwesomeIcons.wrench, tooltip: context.t('Preferences')),
                      AppBarIcon(FontAwesomeIcons.chevronUp, tooltip: context.t('Scroll up')),
                    ],
                    bottom: TabBar(
                      indicatorColor: Colors.white,
                      labelColor: Theme.of(context).primaryColor,
                      tabs: tabMeta.map((tabInfo) => Tab(icon: TabIcon(tabInfo.icon, tooltip: context.t(tabInfo.category)))).toList(),
                    ),
                  ),
                  body: TabBarView(
                    children: tabMeta
                        .map((tabInfo) => tabInfo.builder.call(
                              context,
                              tabInfo,
                              applications.categories.firstWhere((c) => c.name == tabInfo.category, orElse: () => Category("Welcome", {})),
                            ))
                        .toList(),
                  ),
                );
              },
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<Map<String, dynamic>> _readJson() async {
    final String response = await rootBundle.loadString('assets/data/applications.json');
    final data = await json.decode(response);
    return data;
  }
}

class TabIcon extends StatelessWidget {
  const TabIcon(this.iconData, {Key? key, this.tooltip}) : super(key: key);

  final IconData iconData;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    Widget w = Icon(iconData, size: 24);
    if (tooltip != null) w = Tooltip(message: tooltip!, child: w);
    return w;
  }
}

class AppBarIcon extends StatelessWidget {
  const AppBarIcon(this.iconData, {Key? key, this.tooltip}) : super(key: key);

  final IconData iconData;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    Widget w = IconButton(onPressed: () {}, icon: Icon(iconData, size: 16));
    if (tooltip != null) w = Tooltip(message: tooltip!, child: w);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: w,
    );
  }
}
