import '../../../../utils/constants/api_constants.dart';
import '../../../../utils/dio/dio_helper.dart';

class searchRemoteDataSourcesImp {
  DioHelper API = DioHelper();
  searchRemoteDataSourcesImp();

  Future<Map<String, dynamic>> getRemoteDataSources(
      {required String name, int? page, String? companyID}) async {
    // print("////////////////////// remote search ////////////////////////////");
    if (page == null) {
      Map<String, dynamic>? response =
          await API.getData(URL: "${URL.search}$name&seller_id=$companyID");
      print("${URL.search}$name&seller_id=$companyID");
      print("response=========>$response");
      return response!;
    } else {
      final Map<String, dynamic>? response = await API.getData(
          URL: "${URL.search}$name&page=$page&seller_id=$companyID");
      print("The URL ////////////////  URL ////////////////////////////     ");
      print("${URL.search}$name&page=$page&seller_id=$companyID");
      print("response=========>$response");
      return response!;
    }
  }
}
