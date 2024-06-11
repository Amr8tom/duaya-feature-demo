import 'dart:convert';

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:duaya_app/common/common_snak_bar_widget.dart';
import 'package:duaya_app/features/address/data/dataSources/localDataSources.dart';
import 'package:duaya_app/features/address/data/dataSources/remoteDataSources.dart';
import 'package:duaya_app/features/address/data/model/AdressListModel.dart';
import 'package:duaya_app/features/address/data/model/AdressListModel.dart';
import 'package:duaya_app/features/address/data/model/CreateAddress.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/connection/checkNetwork.dart';

class addressRepositoryImpl {
  final addressLocalDataSources localData = addressLocalDataSourcesImp();
  final addressRemoteDataSoureces remoteData = addressRemoteDataSoureces();
  addressRepositoryImpl();
  Future<CreateAddress?> createAddressModel(
      {required Map<String, dynamic> AddressBody}) async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      print("///////// Net Connected ///////////////");
      Map<String, dynamic>? response =
          await remoteData.createAddressData(addressBody: AddressBody);
      localData.cacheAddreessJson(addressJson: jsonEncode(response));
      return CreateAddress.fromJson(response);
    } else {
      print("///////// Net Is Not Connected ///////////////");

      commonToast(S.current.NoInternetConnection);
    }
  }

  Future<AdressListModel?> getAddressListModel(
      {required Map<String, dynamic> addressListBody}) async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      print("///////// Net Connected ///////////////");
      Map<String, dynamic>? response =
          await remoteData.getAddressListData(addressListBody: addressListBody);
      localData.cacheAddreessListJson(addressListJson: jsonEncode(response!));
      return AdressListModel.fromJson(response);
    } else {
      final response = await localData.getAddressListJson();
      return AdressListModel.fromJson(response);
    }
  }
}
