# Localizing the software boutique

## Notes

When the boutique starts, `Flutter` will try to match the system locale with one of the supported locale.

It will do so by trying to match the language code and the country code of the system locale with one that is supported, i.e. it will look for `fr_CH`.

If that is not supported, `Flutter` will then try to match only the language code of the system locale, i.e. it will look for `fr`.

If that also fails, the selected locale will be the first locale in the list of supported locales.

It is therefore important to have `en` as the first locale in the list of supported locales, and it is also important to always have one file per language without country code.

## How to add a supported locale

1. In `lib/software_boutique_app.dart`, add an entry to the `supportedLocales` property of the `MaterialApp` instance :
```
      supportedLocales: const [
        Locale('en', ''),
        Locale('fr', ''),
        Locale('fr', 'CH'),
      ],
```
The order is not important, except for the `en` entry, which must always be the first one, to allow `Flutter` to fall back to english in case the system locale is not supported.

2. Add the `.po` file in `assets/i18n` :
```
$ ls -1 assets/i18n/*.po
en.po
fr.po
fr_CH.po
```

3. Add an entry in `pubspec.yaml`, under the `flutter/assets` key :
```
flutter:
  assets:
    - assets/i18n/en.po
    - assets/i18n/fr.po
    - assets/i18n/fr_CH.po
```


# Misc

To install the window_size dependency, use : 

```
flutter pub add window_size --git-url git://github.com/google/flutter-desktop-embedding.git --git-path plugins/window_size
```
