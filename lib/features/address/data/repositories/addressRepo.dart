import 'dart:convert';

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:duaya_app/common/common_snak_bar_widget.dart';
import 'package:duaya_app/features/address/data/dataSources/localDataSources.dart';
import 'package:duaya_app/features/address/data/dataSources/remoteDataSources.dart';
import 'package:duaya_app/features/address/data/model/AdressListModel.dart';
import 'package:duaya_app/features/address/data/model/AdressListModel.dart';
import 'package:duaya_app/features/address/data/model/ChooseAddressModel.dart';
import 'package:duaya_app/features/address/data/model/CreateAddress.dart';
import 'package:duaya_app/features/address/data/model/DeleteAddressModel.dart';
import 'package:duaya_app/features/address/data/model/DeleteAddressModel.dart';
import 'package:duaya_app/features/address/data/model/DeleteAddressModel.dart';
import 'package:duaya_app/features/address/data/model/UpdateAddressModel.dart';
import 'package:duaya_app/features/address/data/model/updateAddressCart.dart';
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
      Map<String, dynamic>? response =
          await remoteData.createAddressData(addressBody: AddressBody);
      localData.cacheAddreessJson(addressJson: jsonEncode(response));
      return CreateAddress.fromJson(response);
    } else {
      commonToast(S.current.NoInternetConnection);
    }
  }

  Future<UpdateAddressModel?> updateAddressModel(
      {required Map<String, dynamic> AddressBody}) async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      Map<String, dynamic>? response =
          await remoteData.updateAddressData(addressBody: AddressBody);
      return UpdateAddressModel.fromJson(response);
    } else {
      commonToast(S.current.NoInternetConnection);
    }
  }

  /// update addresss in cart
  Future<UpdateAddressCart?> updateAddressInCartModel(
      {required Map<String, dynamic> AddressBody}) async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      Map<String, dynamic>? response =
          await remoteData.updateAddressInCart(addressBody: AddressBody);
      return UpdateAddressCart.fromJson(response);
    } else {
      commonToast(S.current.NoInternetConnection);
    }
  }

  Future<AdressListModel?> getAddressListModel() async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      Map<String, dynamic>? response = await remoteData.getAddressListData();
      localData.cacheAddreessListJson(addressListJson: jsonEncode(response!));
      return AdressListModel.fromJson(response);
    } else {
      final response = await localData.getAddressListJson();
      return AdressListModel.fromJson(response);
    }
  }

  Future<DeleteAddressModel?> deleteAddressFromList(
      {required String ID}) async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      Map<String, dynamic>? response =
          await remoteData.deleteAddressfromList(ID: ID);
      return DeleteAddressModel.fromJson(response);
    } else {
      commonToast(S.current.NoInternetConnection);
    }
  }

  Future<ChooseAddressModel?> chooseAddressFromList(
      {required Map<String, dynamic> addressBody}) async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      Map<String, dynamic>? response =
          await remoteData.chooseAddressData(addressBody: addressBody);
      return ChooseAddressModel.fromJson(response);
    } else {
      commonToast(S.current.NoInternetConnection);
    }
  }
}
