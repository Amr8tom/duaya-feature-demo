import 'package:duaya_app/utils/constants/api_constants.dart';
import 'package:duaya_app/utils/dio/dio_helper.dart';

class GiftRemoteDataSourcesImp {
  DioHelper API = DioHelper();

  Future<Map<String, dynamic>?> getGiftModel() async {
    final response = API.getData(URL: URL.giftAndUserData);
    return response;
  }
}
