import 'package:flutter/material.dart';
import 'package:libroc/localization/language/language_ar.dart';
import 'package:libroc/localization/language/language_de.dart';
import 'package:libroc/localization/language/language_en.dart';
import 'package:libroc/localization/language/language_fr.dart';
import 'package:libroc/localization/language/language_in.dart';
import 'package:libroc/localization/language/language_it.dart';
import 'package:libroc/localization/language/language_jp.dart';
import 'package:libroc/localization/language/language_pt.dart';
import 'package:libroc/localization/language/language_ru.dart';
import 'package:libroc/localization/language/language_tr.dart';

import 'language/languages.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        'en',
        'it',
        'tr',
        'ar',
        'de',
        'fr',
        'hi',
        'ja',
        'pt',
        'ru'
      ].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguageEn();
      case 'it':
        return LanguageIt();
      case 'tr':
        return LanguageTr();
      case 'ar':
        return LanguageAr();
      case 'de':
        return LanguageDe();
      case 'fr':
        return LanguageFr();
      case 'hi':
        return LanguageIn();
      case 'ja':
        return LanguageJp();
      case 'pt':
        return LanguagePt();
      case 'ru':
        return LanguageRu();
      default:
        return LanguageEn();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;
}
