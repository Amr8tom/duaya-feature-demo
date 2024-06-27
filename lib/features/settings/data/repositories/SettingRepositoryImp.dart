import 'dart:convert';

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:duaya_app/common/common_snak_bar_widget.dart';
import 'package:duaya_app/features/gift/data/dataSources/gift_remote.dart';
import 'package:duaya_app/features/gift/data/dataSources/git_local.dart';
import 'package:duaya_app/features/settings/data/dataSoucres/setting_local_data_sources.dart';
import 'package:duaya_app/features/settings/data/model/LogoutModel.dart';
import 'package:duaya_app/features/settings/data/model/LogoutModel.dart';
import 'package:duaya_app/features/settings/data/model/LogoutModel.dart';
import 'package:duaya_app/features/settings/data/model/LogoutModel.dart';
import 'package:duaya_app/features/settings/data/model/profileModel.dart';
import 'package:duaya_app/features/settings/data/model/profileModel.dart';
import 'package:duaya_app/features/settings/data/model/profileModel.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/connection/checkNetwork.dart';
import '../dataSoucres/setting_remote_data_sources.dart';

class SettingRepositoryImp {
  final SettingRemoteDataSoucresImp remoteData = SettingRemoteDataSoucresImp();
  final SettingLocalDataSourceImp localData = SettingLocalDataSourceImp();

  SettingRepositoryImp();

  Future<LogoutModel?> logOut() async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      print(
          "/////////////////////////   Net Connected  ///////////////////////////////////");
      final response = await remoteData.getLogout();
      final model = LogoutModel.fromJson(response);
      commonToast(model.message ?? "");
      return LogoutModel.fromJson(response);
    } else {
      commonToast(S.current.NoInternetConnection);
    }
  }

  Future<ProfileModel> getProfileCounters() async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      print(
          "/////////////////////////   Net Connected  ///////////////////////////////////");
      final response = await remoteData.getProfile();
      localData.cahceProfileModel(profileJson: jsonEncode(response));
      final model = ProfileModel.fromJson(response);
      return ProfileModel.fromJson(response);
    } else {
      final response = await localData.getPofileModel();
      return ProfileModel.fromJson(response);
    }
  }
}
