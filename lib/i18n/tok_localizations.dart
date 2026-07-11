import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Flutter has no built-in Material/Cupertino localizations for `tok`.
// These delegates claim it and hand back the English ones.
const Locale _fallbackLocale = Locale('en');

class TokMaterialLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const TokMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'tok';

  @override
  Future<MaterialLocalizations> load(Locale locale) =>
      GlobalMaterialLocalizations.delegate.load(_fallbackLocale);

  @override
  bool shouldReload(TokMaterialLocalizationsDelegate old) => false;
}

class TokCupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const TokCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'tok';

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      GlobalCupertinoLocalizations.delegate.load(_fallbackLocale);

  @override
  bool shouldReload(TokCupertinoLocalizationsDelegate old) => false;
}
