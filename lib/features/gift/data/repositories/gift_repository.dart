import 'dart:convert';

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:duaya_app/common/common_snak_bar_widget.dart';
import 'package:duaya_app/features/gift/data/dataSources/gift_remote.dart';
import 'package:duaya_app/features/gift/data/dataSources/git_local.dart';
import 'package:duaya_app/features/gift/data/model/UserAndGiftModel.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/connection/checkNetwork.dart';

class GiftRepositoryImpl {
  final GiftRemoteDataSourcesImp remoteData = GiftRemoteDataSourcesImp();
  final GiftLocalDataSourcesImp localData = GiftLocalDataSourcesImp();
  GiftRepositoryImpl();

  Future<UserAndGiftModel> getGiftModel() async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      print(
          "/////////////////////////   Net Connected  ///////////////////////////////////");
      final response = await remoteData.getGiftModel();
      localData.cacheGift(giftBody: jsonEncode(response));
      return UserAndGiftModel.fromJson(response);
    } else {
      final response = await localData.getGift();
      commonToast(S.current.NoInternetConnection);
      return UserAndGiftModel.fromJson(response);
    }
  }
}
