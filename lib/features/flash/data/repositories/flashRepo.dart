import 'dart:convert';
import 'dart:ui';

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:duaya_app/features/flash/data/dataSource/localFlash.dart';
import 'package:duaya_app/features/flash/data/dataSource/remoteFlash.dart';
import '../../../../utils/connection/checkNetwork.dart';
import '../model/flashDealModel.dart';

class flashRepositoryImp {
  flashLocalDataSourceImp localFlash = flashLocalDataSourceImp();
  flashRemoteDataSourecesImp remoteFlash = flashRemoteDataSourecesImp();
  flashRepositoryImp();

  Future<FlashDealModel> getFlashModel() async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      print("///////////////  connected flash ///////////////////");
      Map<String, dynamic>? flashJson = await remoteFlash.getFlashData();
      localFlash.cacheFlashLocalData(flashJson: jsonEncode(flashJson));
      print(flashJson);
      final FlashDealModel flashModel =
          await FlashDealModel.fromJson(flashJson);
      return flashModel;
    } else {
      print("///////////////  Net Not connected flash ///////////////////");
      final Map<String, dynamic> flashModel =
          await localFlash.getFlashLocalData();
      return FlashDealModel.fromJson(flashModel);
    }
  }
}
