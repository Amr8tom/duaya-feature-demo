import 'dart:async';
import 'dart:convert';

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:duaya_app/common/common_snak_bar_widget.dart';
import 'package:duaya_app/features/services/presentation/expire_product/data/dataSources/local_data_sources.dart';
import 'package:duaya_app/features/services/presentation/expire_product/data/dataSources/remote_data_sources.dart';
import 'package:duaya_app/features/services/presentation/expire_product/data/model/expiredList.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../../utils/connection/checkNetwork.dart';
import '../model/CreateExpiredModel.dart';
import '../model/deleteExpired.dart';
import '../model/updateEXpiredModel.dart';

class ExpiredProductRepository {
  expiredProductLocalDataSourceImp localData =
      expiredProductLocalDataSourceImp();
  ExpiredListRemoteDataSources remoteData = ExpiredListRemoteDataSources();
  ExpiredProductRepository();

  Future<ExpiredListModel> getExpiredListModel() async {
    bool isConnedcted =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (isConnedcted) {
      print("//////////// connected  ////////////");
      Map<String, dynamic>? response = await remoteData.getExpiredList();
      localData.cacheExpiredProductsList(
          expiredProductsJson: jsonEncode(response));
      return ExpiredListModel.fromJson(response);
    } else {
      print("//////////// not connected  ////////////");
      final response = localData.getExpiredProducts();
      return ExpiredListModel.fromJson(response);
    }
  }

  Future<CreateExpiredModel?> createNewExpiredProduct(
      {required Map<String, dynamic> CreateExpiredJson}) async {
    bool isConnedcted =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (isConnedcted) {
      print("//////////// connected  ////////////");
      Map<String, dynamic>? response = await remoteData.createNewExpiredProduct(
          CreateExpiredJson: CreateExpiredJson);
      return CreateExpiredModel.fromJson(response);
    } else {
      print("//////////// not connected  ////////////");
      commonToast(S.current.NoInternetConnection);
    }
  }

  /// update existing product
  Future<UpdateEXpiredModel?> UpdateExistExpiredProduct(
      {required Map<String, dynamic> updateExpiredJson,
      required String ID}) async {
    bool isConnedcted =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (isConnedcted) {
      print("//////////// connected  ////////////");
      Map<String, dynamic>? response =
          await remoteData.updateExistExpiredProduct(
              updateExpiredJson: updateExpiredJson, ID: ID);
      return UpdateEXpiredModel.fromJson(response);
    } else {
      print("//////////// not connected  ////////////");
      commonToast(S.current.NoInternetConnection);
    }
  }

  /// delete existing product
  Future<DeleteExpired?> deleteExistExpiredProduct({required String ID}) async {
    bool isConnedcted =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (isConnedcted) {
      print("//////////// connected  ////////////");
      Map<String, dynamic>? response =
          await remoteData.deleteExistExpiredProduct(ID: ID);
      return DeleteExpired.fromJson(response);
    } else {
      print("//////////// not connected  ////////////");
      commonToast(S.current.NoInternetConnection);
    }
  }
}
