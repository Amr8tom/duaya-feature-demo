import 'package:dio/dio.dart';
import 'package:duaya_app/utils/constants/api_constants.dart';
import 'package:duaya_app/utils/dio/dio_helper.dart';

class loginRemoteDataSoureces {
  Future<Map<String, dynamic>?> getLoginData(
      {required Map<String, dynamic> loginBody}) {
    DioHelper API = DioHelper();
    Future<Map<String, dynamic>?> response =
        API.postData(URL: URL.login, body: loginBody);
    print(response);
    return response;
  }
}
