import '../../../../utils/constants/api_constants.dart';
import '../../../../utils/dio/dio_helper.dart';

class searchRemoteDataSourcesImp {
  DioHelper API = DioHelper();
  searchRemoteDataSourcesImp();

  Future<Map<String, dynamic>> getRemoteDataSources(
      {required String name, required cityID, int? page}) async {
    // print("////////////////////// remote search ////////////////////////////");
    if (page == null) {
      Map<String, dynamic>? response =
          await API.getData(URL: "${URL.search}$name");
      print("${URL.search}$name");
      print(response);
      print(response);

      return response!;
    } else {
      final Map<String, dynamic>? response =
          await API.getData(URL: "${URL.search}$name&page=$page");
      print("The URL ////////////////  URL ////////////////////////////     ");
      print("${URL.search}$name&page=$page");
      print("${URL.search}$name&page=$page");
      print("${URL.search}$name&page=$page");
      print("${URL.search}$name&page=$page");
      print(response);
      return response!;
    }
  }
}
