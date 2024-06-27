import 'package:dio/dio.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/api_constants.dart';
import 'package:duaya_app/utils/dio/dio_helper.dart';

class WalletRemoteDataSoureces {
  DioHelper API = DioHelper();
  WalletRemoteDataSoureces();
  Future<Map<String, dynamic>?> getWalletBalance() {
    Future<Map<String, dynamic>?> response =
        API.getData(URL: URL.walletBalance);
    return response;
  }

  Future<Map<String, dynamic>?> getWalletHistory() {
    Future<Map<String, dynamic>?> response =
        API.getData(URL: URL.walletHistory);
    return response;
  }
}
