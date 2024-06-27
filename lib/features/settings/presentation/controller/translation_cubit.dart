import 'package:bloc/bloc.dart';
import 'package:duaya_app/features/settings/data/model/LogoutModel.dart';
import 'package:duaya_app/features/settings/data/model/profileModel.dart';
import 'package:duaya_app/features/settings/data/repositories/SettingRepositoryImp.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:duaya_app/utils/local_storage/cach_keys.dart';
import 'package:duaya_app/utils/local_storage/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

import '../../../../generated/l10n.dart';
import '../../../../routing/routes_name.dart';

part 'translation_state.dart';

class SettinglationCubit extends Cubit<TranslationState> {
  SettinglationCubit() : super(TranslationInitial());
  late Locale currentLanguage;
  SettingRepositoryImp repo = SettingRepositoryImp();
  late LogoutModel logoutmodel;
  late ProfileModel profileModel;
  bool isShowAvatar = false;

  Future<void> setCurrentLangeuage({required String language}) async {
    currentLanguage = Locale(language);
    await PrefService.putString(key: CacheKeys.lang, value: language);
    S.load(Locale(language));
    emit(nextTranslation());
  }

  void changeAvatar() {
    emit(AvatarLoading());
    isShowAvatar = !isShowAvatar;
    emit(AvatarSuccess());
  }

  Future<void> fetchProfileData() async {
    emit(fetchProfileDataLoading());
    profileModel = await repo.getProfileCounters();
    emit(fetchProfileDataSuccess());
  }

  Future<void> logOut({required BuildContext context}) async {
    emit(LogOutLoading());
    PrefService.removeFromShared(key: CacheKeys.password);
    PrefService.removeFromShared(key: CacheKeys.email);
    PrefService.removeFromShared(key: CacheKeys.token);
    context.pushReplacementNamed(DRoutesName.loginRoute);
    logoutmodel = (await repo.logOut())!;
    emit(LogOutSuccess());
  }
}
