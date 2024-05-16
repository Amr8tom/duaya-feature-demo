import 'dart:convert';

import 'package:duaya_app/utils/constants/api_constants.dart';
import 'package:duaya_app/utils/dio/dio_helper.dart';

class remoteDataSourcesImpForCompany {
  remoteDataSourcesImpForCompany();
  DioHelper API = DioHelper();

  Future<Map<String, dynamic>> getCompanyByPage({page = 1}) async {
    final Map<String, dynamic>? response =
        await API.getData(URL: "${URL.companiesByPage}$page");
    return response!;
  }

  Future<Map<String, dynamic>> getCompanyDetails({required String id}) async {
    Map<String, dynamic>? response =
        await API.getData(URL: "${URL.companyDetails}$id");
    return response!;
  }

  Future<Map<String, dynamic>?> getNewProductCompanyByID({id = 0}) async {
    DioHelper API = DioHelper();
    final Map<String, dynamic>? response =
        await API.getData(URL: "${URL.companyNewProducts}$id");
    print(response);
    print("${URL.companyNewProducts}$id");
    return response;
  }

  Future<Map<String, dynamic>?> getBestSellerProductCompanyByID(
      {id = 0}) async {
    DioHelper API = DioHelper();
    final Map<String, dynamic>? response =
        await API.getData(URL: "${URL.companyProductsBestSeller}$id");
    print(response);
    print("${URL.companyProductsBestSeller}$id");
    return response;
  }
}
