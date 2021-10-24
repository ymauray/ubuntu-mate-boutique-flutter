import 'package:flutter/material.dart';
import 'package:softwareboutique/util/colors.dart';
import 'package:softwareboutique/i18n/software_boutique_localizations.dart';

class UnsupportedDistro extends StatelessWidget {
  const UnsupportedDistro({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            context.t('Not a supported Linux distribution'),
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: UbuntuMateColors.chelseaCucumberGreen,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            context.t('Sorry, Ubuntu MATE Software Boutique is not currently supported on your distribution.'),
            style: Theme.of(context).textTheme.bodyText1,
          ),
        )
      ],
    );
  }
}
