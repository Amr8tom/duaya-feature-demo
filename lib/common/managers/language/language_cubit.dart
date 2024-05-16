// import 'package:duaya_app/utils/constants/exports.dart';
// import 'package:duaya_app/utils/local_storage/cache_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// part 'language_state.dart';
//
// class LanguageCubit extends Cubit<LanguageState> {
//   bool isEnglish = true;
//   bool isDarkMode = false;
//
//   LanguageCubit() : super(LanguageInitial());
//
//   void getSavedLanguage() {
//     final cachedLanguageCode = PrefService.getCachedLanguage();
//     isEnglish = (cachedLanguageCode == 'en');
//     emit(ChangeLanguageState(locale: Locale(cachedLanguageCode)));
//   }
//
//   Future<void> changeLanguage(String languageCode) async {
//     await PrefService.cacheLanguage(languageCode);
//     isEnglish = (languageCode == 'en');
//     emit(ChangeLanguageState(locale: Locale(languageCode)));
//   }
// }