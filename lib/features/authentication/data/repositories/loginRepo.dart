import 'dart:convert';

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:duaya_app/features/authentication/data/dataSource/loginLocal.dart';
import 'package:duaya_app/features/authentication/data/dataSource/loginRemote.dart';
import 'package:duaya_app/features/authentication/data/model/loginModel.dart';
import '../../../../utils/connection/checkNetwork.dart';

class loginRepositoryImpl {
  final loginLocalDataSourceImp localData = loginLocalDataSourceImp();
  final loginRemoteDataSoureces remoteData = loginRemoteDataSoureces();
  loginRepositoryImpl();

  Future<LoginModel> getLoginModel(
      {required Map<String, dynamic> loginBody}) async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      print("///////// Net Connected ///////////////");
      Map<String, dynamic>? response =
          await remoteData.getLoginData(loginBody: loginBody);
      localData.cacheLoginJson(loginJson: jsonEncode(response));

      return LoginModel.fromJson(response);
    } else {
      print("///////// Net Is Not Connected ///////////////");
      Map<String, dynamic>? response = await localData.getLoginJson();
      return LoginModel.fromJson(response);
    }
  }
}
