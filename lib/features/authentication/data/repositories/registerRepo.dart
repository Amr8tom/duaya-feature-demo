import 'dart:convert';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:duaya_app/features/authentication/data/dataSource/registerLocal.dart';
import 'package:duaya_app/features/authentication/data/dataSource/registerRemote.dart';
import 'package:duaya_app/features/authentication/data/model/CityModel.dart';
import 'package:duaya_app/features/authentication/data/model/StateID.dart';
import 'package:duaya_app/features/authentication/data/model/countryModel.dart';
import 'package:duaya_app/features/authentication/data/model/countryModel.dart';
import 'package:duaya_app/features/authentication/data/model/countryModel.dart';
import 'package:duaya_app/features/authentication/data/model/registerModel.dart';
import '../../../../utils/connection/checkNetwork.dart';

////////// eng/amrAlaaAli         01011577033
class rigsterRepositoryImpl {
  final rigsterLocalDataSourceImp localData = rigsterLocalDataSourceImp();
  final rigsterRemoteDataSoureces remoteData = rigsterRemoteDataSoureces();
  rigsterRepositoryImpl();
  Future<RegisterModel> getRisgterModel({required FormData rigsterBody}) async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      print("///////// Net Connected ///////////////");
      Map<String, dynamic>? response =
          await remoteData.getRigsterData(rigsterBody: rigsterBody);
      print(rigsterBody.fields);
      print(response);
      localData.cacheRigsterJson(rigsterLogin: jsonEncode(response));
      return RegisterModel.fromJson(response);
    } else {
      print("///////// Net Is Not Connected ///////////////");
      Map<String, dynamic>? response = await localData.getRigsterJson();
      return RegisterModel.fromJson(response);
    }
  }

  Future<CountryModel> getCountryModel() async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      Map<String, dynamic>? response = await remoteData.getCountryList();
      localData.cacheCountryJson(countryList: jsonEncode(response));
      return CountryModel.fromJson(response);
    } else {
      Map<String, dynamic>? response = await localData.getCountryListJson();
      return CountryModel.fromJson(response);
    }
  }

  Future<CityModel> getCityModel({required String countryID}) async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      Map<String, dynamic>? response =
          await remoteData.getCityList(countryID: countryID);
      localData.cacheCityJson(CityList: jsonEncode(response));
      return CityModel.fromJson(response);
    } else {
      Map<String, dynamic>? response = await localData.getCityListJson();
      return CityModel.fromJson(response);
    }
  }

  Future<StateIdModel> getStateModel({required String cityID}) async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      Map<String, dynamic>? response =
          await remoteData.getStateList(cityID: cityID);
      localData.cacheStateJson(stateList: jsonEncode(response));
      return StateIdModel.fromJson(response);
    } else {
      Map<String, dynamic>? response = await localData.getStateListJson();
      return StateIdModel.fromJson(response);
    }
  }
}
