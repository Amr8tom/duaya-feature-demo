import 'package:dio/dio.dart';
import 'package:duaya_app/utils/constants/api_constants.dart';
import 'package:duaya_app/utils/dio/dio_helper.dart';

class addressRemoteDataSoureces {
  Future<Map<String, dynamic>?> createAddressData(
      {required Map<String, dynamic> addressBody}) {
    DioHelper API = DioHelper();
    Future<Map<String, dynamic>?> response =
        API.postData(URL: URL.createAddress, body: addressBody);
    return response;
  }

  Future<Map<String, dynamic>?> getAddressListData(
      {required Map<String, dynamic> addressListBody}) {
    DioHelper API = DioHelper();
    Future<Map<String, dynamic>?> response =
        API.postData(URL: URL.getAddressList, body: addressListBody);
    return response;
  }
}
