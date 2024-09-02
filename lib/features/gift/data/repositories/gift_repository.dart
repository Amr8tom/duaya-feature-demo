import 'dart:convert';

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:duaya_app/common/common_snak_bar_widget.dart';
import 'package:duaya_app/features/gift/data/dataSources/gift_remote.dart';
import 'package:duaya_app/features/gift/data/dataSources/git_local.dart';
import 'package:duaya_app/features/gift/data/model/convert_clubpoint_model.dart';
import 'package:duaya_app/features/gift/data/model/get_clubpoint_model.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/connection/checkNetwork.dart';
import '../../domain/repositories/gift_repository.dart';

class GiftRepositoryImpl implements GiftRepository {
  final GiftRemoteDataSourcesImp remoteData = GiftRemoteDataSourcesImp();
  final GiftLocalDataSourcesImp localData = GiftLocalDataSourcesImp();
  GiftRepositoryImpl();

  Future<GetClubpointModel> getGiftModel() async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      print(
          "/////////////////////////   Net Connected  ///////////////////////////////////");
      final response = await remoteData.getGiftModel();
      localData.cacheGift(giftBody: jsonEncode(response));
      return GetClubpointModel.fromJson(response);
    } else {
      final response = await localData.getGift();
      commonToast(S.current.NoInternetConnection);
      return GetClubpointModel.fromJson(response);
    }
  }

  Future<ConvertClubpointModel?> convertClubpointModel(
      {required Map<String, dynamic> params}) async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      print(
          "/////////////////////////   Net Connected  ///////////////////////////////////");
      final response = await remoteData.convertClubpointModel(params: params);
      return ConvertClubpointModel.fromJson(response);
    } else {
      commonToast(S.current.NoInternetConnection);
    }
  }
}
