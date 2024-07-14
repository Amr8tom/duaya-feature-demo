import 'dart:async';
import 'dart:convert';

import 'package:duaya_app/features/search/data/dataSource/searchLocalDataSources.dart';
import 'package:duaya_app/features/search/data/dataSource/searchRemoteDataSources.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';

import '../../../../utils/connection/checkNetwork.dart';

class searchRepoImp {
  searchLocalDataSourcesImp localData = searchLocalDataSourcesImp();
  searchRemoteDataSourcesImp remoteData = searchRemoteDataSourcesImp();
  searchRepoImp();
  Future<Map<String, dynamic>> getSearchData(
      {required String name, required String cityID, int? page}) async {
    bool isConnected =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (page == null) {
      if (isConnected) {
        Map<String, dynamic> response =
            await remoteData.getRemoteDataSources(name: name, cityID: cityID);
        localData.cacheSearchData(searchData: jsonEncode(response), name: name);
        return response;
      } else {
        Map<String, dynamic> response =
            await localData.getSearchData(name: name);
        return response;
      }
    } else {
      if (isConnected) {
        Map<String, dynamic> response = await remoteData.getRemoteDataSources(
            name: name, page: page, cityID: cityID);
        localData.cacheSearchData(
            searchData: jsonEncode(response), name: name, page: page);
        return response;
      } else {
        Map<String, dynamic> response =
            await localData.getSearchData(name: name, page: page);
        return response;
      }
    }
  }
}
