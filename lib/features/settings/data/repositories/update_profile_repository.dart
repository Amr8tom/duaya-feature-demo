import 'dart:convert';

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:duaya_app/features/settings/data/dataSoucres/update_profile_local_data_sources.dart';
import 'package:duaya_app/features/settings/data/dataSoucres/update_profile_local_data_sources.dart';
import 'package:duaya_app/features/settings/data/dataSoucres/update_profile_remote_data_sources.dart';

import 'package:duaya_app/features/settings/data/model/updateProfileModel.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/connection/checkNetwork.dart';
import '../dataSoucres/setting_remote_data_sources.dart';

class UpdateProfileRepositoryImp {
  final UpdateProfileRemoteDataSoucresImp remoteData =
      UpdateProfileRemoteDataSoucresImp();
  final UpdateProfileLocalDataSourceImp localData =
      UpdateProfileLocalDataSourceImp();

  UpdateProfileRepositoryImp();

  Future<UpdateProfileModel> fetchUpdateProfileData(
      {required FormData updateProfileBody}) async {
    print(updateProfileBody.fields);
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      print(
          "/////////////////////////   Net Connected  ///////////////////////////////////");
      final response = await remoteData.fetchUpdateProfile(
          updateProfileBody: updateProfileBody);
      localData.cahceUpdateProfileModel(
          updateProfileJson: jsonEncode(response));
      final model = UpdateProfileModel.fromJson(response);
      return UpdateProfileModel.fromJson(response);
    } else {
      final response = await localData.getupdatePofileModel();
      return UpdateProfileModel.fromJson(response);
    }
  }
}
