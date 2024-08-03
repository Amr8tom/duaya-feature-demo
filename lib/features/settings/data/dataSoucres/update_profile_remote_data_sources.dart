import 'package:dio/dio.dart';
import 'package:duaya_app/utils/constants/api_constants.dart';
import 'package:duaya_app/utils/dio/dio_helper.dart';

class UpdateProfileRemoteDataSoucresImp {
  DioHelper API = DioHelper();

  Future<Map<String, dynamic>?> fetchUpdateProfile(
      {required FormData updateProfileBody}) async {
    final reponose =
        API.postFormData(URL: URL.updateProfile, formData: updateProfileBody);
    return reponose;
  }
}
