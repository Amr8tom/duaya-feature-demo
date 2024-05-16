import 'package:dio/dio.dart';
import 'package:duaya_app/utils/constants/api_constants.dart';
import 'package:duaya_app/utils/dio/dio_helper.dart';

class rigsterRemoteDataSoureces {
  Future<Map<String, dynamic>?> getRigsterData(
      {required Map<String, dynamic> rigsterBody}) async {
    DioHelper API = DioHelper();
    final response = await API.postData(URL: URL.register, body: rigsterBody);

    return response;
  }

  Future<Map<String, dynamic>?> getCitiesData() async {
    DioHelper API = DioHelper();
    final response = await API.getData(URL: URL.cities);
    return response;
  }
}
