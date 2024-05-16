import 'package:bloc/bloc.dart';
import 'package:duaya_app/utils/local_storage/cach_keys.dart';
import 'package:duaya_app/utils/local_storage/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../generated/l10n.dart';

part 'translation_state.dart';

class TranslationCubit extends Cubit<TranslationState> {
  TranslationCubit() : super(TranslationInitial());
  late Locale currentLanguage;

  Future<void> setCurrentLangeuage({required String language}) async {
    currentLanguage = Locale(language);
    await PrefService.putString(key: CacheKeys.lang, value: language);
    S.load(Locale(language));
    emit(nextTranslation());
  }
}
