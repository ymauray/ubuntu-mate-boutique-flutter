import 'package:flutter/material.dart';
import "package:gettext/gettext.dart";
import 'package:gettext_parser/gettext_parser.dart' as gettext_parser;
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

class SoftwareBoutiqueLocalizations {
  static const LocalizationsDelegate<SoftwareBoutiqueLocalizations> delegate = _SoftwareBoutiqueLocalizationsDelegate();

  final _gt = Gettext(
      onWarning: kDebugMode
          ? ((message) {
              final r = RegExp(r'^No translation was found for msgid "(.*)" in msgctxt "(.*)" and domain "(.*)"$');
              final matches = r.firstMatch(message);
              var msgid = matches!.group(1);
              print("msgid \"$msgid\"\nmsgstr \"\"\n \n");
            })
          : null);

  SoftwareBoutiqueLocalizations(String? poContent) {
    if (poContent != null) _gt.addLocale(gettext_parser.po.parse(poContent));
  }

  static SoftwareBoutiqueLocalizations of(BuildContext context) {
    return Localizations.of<SoftwareBoutiqueLocalizations>(context, SoftwareBoutiqueLocalizations)!;
  }

  String t(String key) {
    return _gt.gettext(key);
  }
}

class _SoftwareBoutiqueLocalizationsDelegate extends LocalizationsDelegate<SoftwareBoutiqueLocalizations> {
  const _SoftwareBoutiqueLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  Future<SoftwareBoutiqueLocalizations> load(Locale locale) async {
    String? poContent;
    for (var asset in ['${locale.languageCode}_${locale.countryCode}', locale.languageCode, 'en']) {
      try {
        poContent = await rootBundle.loadString('assets/i18n/$asset.po', cache: false);
        break;
      } catch (e) {
        /// Nothing to do, really ...
        poContent = null;
      }
    }
    return SoftwareBoutiqueLocalizations(poContent);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<SoftwareBoutiqueLocalizations> old) {
    return true;
  }
}

extension SoftwareBoutiqueLocalizationExt on BuildContext {
  static final Map<String, String> _cache = {};

  String t(String key) {
    var msg = _cache[key];

    if (msg == null) {
      msg = SoftwareBoutiqueLocalizations.of(this).t(key);
      _cache[key] = msg;
    }

    return msg;
  }
}
