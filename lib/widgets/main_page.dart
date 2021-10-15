import 'package:flutter/material.dart';
import 'package:softwareboutique/extensions/colors_ext.dart';
import 'package:softwareboutique/i18n/software_boutique_localizations.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        context.t('Hello, world !'),
        style: Theme.of(context).textTheme.headline4?.copyWith(color: UbuntuMateColors.chelseaCucumberGreen),
      ),
    );
  }
}
