import 'package:duaya_app/utils/constants/api_constants.dart';
import 'package:duaya_app/utils/dio/dio_helper.dart';

class GiftRemoteDataSourcesImp {
  DioHelper API = DioHelper();

  Future<Map<String, dynamic>?> getGiftModel() async {
    final response = API.getData(URL: URL.clubPointList);
    return response;
  }

  Future<Map<String, dynamic>?> convertClubpointModel(
      {required Map<String, dynamic> params}) async {
    final response = API.postData(URL: URL.clubPointConvert, body: params);
    return response;
  }
}
