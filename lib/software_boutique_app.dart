import 'package:flutter/material.dart';
import 'package:softwareboutique/i18n/software_boutique_localizations.dart';
import 'package:softwareboutique/widgets/main_page.dart';
import 'package:window_size/window_size.dart';
import 'package:yaru/yaru.dart' as yaru;
import 'package:flutter_localizations/flutter_localizations.dart';

class SoftwareBoutiqueApp extends StatelessWidget {
  const SoftwareBoutiqueApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        SoftwareBoutiqueLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('fr', ''),
      ],
      onGenerateTitle: (context) {
        var title = context.t('Software Boutique');
        setWindowTitle(title);
        return title;
      },
      home: const MainPage(),
      theme: yaru.lightTheme,
      darkTheme: yaru.darkTheme,
    );
  }
}
