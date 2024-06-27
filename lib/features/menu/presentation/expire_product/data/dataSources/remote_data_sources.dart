import 'package:duaya_app/utils/constants/api_constants.dart';
import 'package:duaya_app/utils/dio/dio_helper.dart';

class ExpiredListRemoteDataSources {
  DioHelper API = DioHelper();
  ExpiredListRemoteDataSources();

  Future<Map<String, dynamic>?> getExpiredList() async {
    final response = await API.getData(URL: URL.expiredList);
    print(response);
    return response;
  }

  /// create new expired product
  Future<Map<String, dynamic>?> createNewExpiredProduct(
      {required Map<String, dynamic> CreateExpiredJson}) async {
    final response =
        await API.postData(URL: URL.expiredCreate, body: CreateExpiredJson);
    print(response);
    return response;
  }

  ///   update existing expired product
  Future<Map<String, dynamic>?> updateExistExpiredProduct(
      {required Map<String, dynamic> updateExpiredJson,
      required String ID}) async {
    final response = await API.postData(
        URL: "${URL.expiredUpdate}$ID", body: updateExpiredJson);
    print(response);
    return response;
  }

  Future<Map<String, dynamic>?> deleteExistExpiredProduct(
      {required String ID}) async {
    final response = await API.deleteData(URL: "${URL.expiredDelete}$ID");
    print(response);
    return response.data;
  }
}
