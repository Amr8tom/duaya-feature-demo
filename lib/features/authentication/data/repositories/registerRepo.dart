import 'dart:convert';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:duaya_app/features/authentication/data/dataSource/registerLocal.dart';
import 'package:duaya_app/features/authentication/data/dataSource/registerRemote.dart';
import 'package:duaya_app/features/authentication/data/model/registerModel.dart';
import '../../../../utils/connection/checkNetwork.dart';
import '../model/citiesModel.dart';

////////// eng/amrAlaaAli         01011577033
class rigsterRepositoryImpl {
  final rigsterLocalDataSourceImp localData = rigsterLocalDataSourceImp();
  final rigsterRemoteDataSoureces remoteData = rigsterRemoteDataSoureces();
  rigsterRepositoryImpl();
  Future<RegisterModel> getRisgterModel(
      {required Map<String, dynamic> rigsterBody}) async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      print("///////// Net Connected ///////////////");
      Map<String, dynamic>? response =
          await remoteData.getRigsterData(rigsterBody: rigsterBody);
      print(rigsterBody);
      localData.cacheRigsterJson(rigsterLogin: jsonEncode(response));
      return RegisterModel.fromJson(response);
    } else {
      print("///////// Net Is Not Connected ///////////////");
      Map<String, dynamic>? response = await localData.getRigsterJson();
      return RegisterModel.fromJson(response);
    }
  }

  Future<CitiesModel> getCitiesModel() async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      Map<String, dynamic>? response = await remoteData.getCitiesData();
      localData.cacheCitiesJson(cities: jsonEncode(response));
      return CitiesModel.fromJson(response);
    } else {
      Map<String, dynamic>? response = await localData.getCitiesJson();
      return CitiesModel.fromJson(response);
    }
  }
}
