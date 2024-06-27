import 'package:duaya_app/utils/constants/api_constants.dart';
import 'package:duaya_app/utils/dio/dio_helper.dart';

class SettingRemoteDataSoucresImp {
  DioHelper API = DioHelper();
  Future<Map<String, dynamic>?> getLogout() async {
    final reponose = API.getData(URL: URL.logout);
    return reponose;
  }

  Future<Map<String, dynamic>?> getProfile() async {
    final reponose = API.getData(URL: URL.profile);
    return reponose;
  }
}
