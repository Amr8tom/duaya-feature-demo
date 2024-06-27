import 'package:dio/dio.dart';
import 'package:duaya_app/common/common_snak_bar_widget.dart';
import 'package:duaya_app/utils/constants/api_constants.dart';
import 'package:duaya_app/utils/dio/dio_helper.dart';

class ShortComingRemoteDataSourcesImp {
  DioHelper API = DioHelper();
  ShortComingRemoteDataSourcesImp();

  Future sendComingShortFile({required FormData? dataImage}) async {
    final response =
        await API.postFormData(URL: URL.shortComing, formData: dataImage);
    print(response);
    return response;
  }
}
