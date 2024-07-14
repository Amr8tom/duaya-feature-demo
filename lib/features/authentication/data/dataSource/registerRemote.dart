import 'package:dio/dio.dart';
import 'package:duaya_app/utils/constants/api_constants.dart';
import 'package:duaya_app/utils/dio/dio_helper.dart';

class rigsterRemoteDataSoureces {
  Future<Map<String, dynamic>?> getRigsterData(
      {required FormData rigsterBody}) async {
    DioHelper API = DioHelper();
    final response =
        await API.postFormData(URL: URL.register, formData: rigsterBody);
    print(rigsterBody);
    print(rigsterBody);
    print(rigsterBody);
    print(response);
    return response;
  }

  Future<Map<String, dynamic>?> getCountryList() async {
    DioHelper API = DioHelper();
    final response = await API.getData(URL: "${URL.countries}");
    return response;
  }

  Future<Map<String, dynamic>?> getCityList({required String countryID}) async {
    DioHelper API = DioHelper();
    final response =
        await API.getData(URL: "${URL.GetCitiesByCountryID}$countryID");
    return response;
  }

  Future<Map<String, dynamic>?> getStateList({required String cityID}) async {
    DioHelper API = DioHelper();
    final response = await API.getData(URL: "${URL.statiesByCityID}$cityID");
    return response;
  }
}
