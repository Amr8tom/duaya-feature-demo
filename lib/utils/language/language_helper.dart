import 'dart:convert';

import 'package:duaya_app/utils/constants/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DLanguageHelper {
  final Locale? locale;

  DLanguageHelper({this.locale});

  static DLanguageHelper? of(BuildContext context) {
    return Localizations.of<DLanguageHelper>(context, DLanguageHelper);
  }

  late Map<String, String> _localStrings;

  static const String _path = 'assets/lang/';

  Future loadJsonFiles() async {
    String encodeString =
        await rootBundle.loadString("$_path${locale!.languageCode}.json");
    Map<String, dynamic> jsonMap = jsonDecode(encodeString);
    _localStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  String translate(String key) {
    return _localStrings[key] ?? '';
  }

  static LocalizationsDelegate<DLanguageHelper> delegate = _AppLocalDelegate();
}

class _AppLocalDelegate extends LocalizationsDelegate<DLanguageHelper> {
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<DLanguageHelper> load(Locale locale) async {
    DLanguageHelper appLocal = DLanguageHelper(locale: locale);
    await appLocal.loadJsonFiles();
    return appLocal;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<dynamic> old) {
    return false;
  }
}

extension TranslateString on String {
  String tr(BuildContext context) {
    return DLanguageHelper.of(context)!.translate(this);
  }
}
