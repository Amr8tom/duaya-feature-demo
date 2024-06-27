import 'package:dio/dio.dart';
import 'package:duaya_app/utils/constants/api_constants.dart';
import 'package:duaya_app/utils/dio/dio_helper.dart';

class flashRemoteDataSourecesImp {
  Future<Map<String, dynamic>?> getFlashData() {
    DioHelper API = DioHelper();
    Future<Map<String, dynamic>?> response = API.getData(URL: URL.flasDeal);
    return response;
  }

  Future<Map<String, dynamic>?> getFlashTodayData() {
    DioHelper API = DioHelper();
    Future<Map<String, dynamic>?> response = API.getData(URL: URL.todayDeals);
    return response;
  }
}
