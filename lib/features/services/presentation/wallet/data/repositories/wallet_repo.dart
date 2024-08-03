import 'dart:convert';

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:duaya_app/features/home/data/model/bestSellerModel.dart';
import 'package:duaya_app/features/menu/presentation/wallet/data/datasources/localDataSources.dart';
import 'package:duaya_app/features/menu/presentation/wallet/data/datasources/remoteDataSources.dart';
import 'package:duaya_app/features/menu/presentation/wallet/data/model/wallet_history.dart';
import '../../../../../../utils/connection/checkNetwork.dart';
import '../model/wallet_balance.dart';

class WalletReposoitoryImp {
  walletLocalDataSourcesImp localData = walletLocalDataSourcesImp();
  WalletRemoteDataSoureces remoteData = WalletRemoteDataSoureces();
  WalletReposoitoryImp();

  Future<WalletBalanceModel> getWalletBalance() async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      print("//////////// connected  ////////////");
      var response = await remoteData.getWalletBalance();
      localData.cacheWalletBalance(walletJson: jsonEncode(response));
      print(response);
      return WalletBalanceModel.fromJson(response);
    } else {
      print("////////////////  not connected //////////////////");
      var response = await localData.getWalletBalance();
      print(response);

      return WalletBalanceModel.fromJson(response);
    }
  }

  Future<WalletHistory> getWalletHistory() async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      print("//////////// connected  ////////////");
      var response = await remoteData.getWalletHistory();
      localData.cacheWalletBalance(walletJson: jsonEncode(response));
      print(response);
      return WalletHistory.fromJson(response);
    } else {
      print("////////////////  not connected //////////////////");
      var response = await localData.getWalletHistory();
      print(response);

      return WalletHistory.fromJson(response);
    }
  }
}
