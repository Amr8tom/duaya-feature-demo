import '../../../../utils/constants/api_constants.dart';
import '../../../../utils/dio/dio_helper.dart';

class searchRemoteDataSourcesImp {
  DioHelper API = DioHelper();
  searchRemoteDataSourcesImp();

  Future<Map<String, dynamic>> getRemoteDataSources(
      {required String name, required cityID, int? page}) async {
    print("////////////////////// remote search ////////////////////////////");
    if (page == null) {
      Map<String, dynamic>? response =
          await API.getData(URL: "${URL.search}$name");
      print(response);
      return response!;
    } else {
      final Map<String, dynamic>? response = await API.getData(
          URL: "${URL.search}$name&page=$page&brands=$cityID");
      print("${URL.search}$name&page=$page");
      print("${URL.search}$name&page=$page");
      print("${URL.search}$name&page=$page");
      print("${URL.search}$name&page=$page");
      print(response);
      return response!;
    }
  }
}
