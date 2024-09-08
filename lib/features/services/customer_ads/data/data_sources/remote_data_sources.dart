import 'package:duaya_app/features/services/customer_ads/data/models/ad_details_model.dart';
import 'package:duaya_app/features/services/customer_ads/data/models/get_all_customer_ads.dart';
import 'package:duaya_app/utils/constants/api_constants.dart';
import 'package:duaya_app/utils/dio/dio_helper.dart';
import 'package:duaya_app/utils/error/failure.dart';

abstract class CustomerAdsRemoteDataSources {
  Future<GetAllCustomerAds> getCustomerAds();
  Future<AdDetailsModel> getAdDetails({required String ID});
}

class CustomerAdsRemoteDataSourcesImp implements CustomerAdsRemoteDataSources {
  final DioHelper dio;
  CustomerAdsRemoteDataSourcesImp(this.dio);

  @override
  Future<GetAllCustomerAds> getCustomerAds() async {
    try {
      final response = await dio.getData(URL: URL.customerAllAds);
      print("response =========================> $response");
      return GetAllCustomerAds.fromJson(response);
    } on ServerFailure {
      throw ServerFailure(
          message: "=================== Server error =======================");
    }
  }

  @override
  Future<AdDetailsModel> getAdDetails({required String ID}) async {
    try {
      final response =
          await dio.getData(URL: "${URL.customerAdsProductDetails}$ID");
      print("response =========================> $response");
      return AdDetailsModel.fromJson(response);
    } on ServerFailure {
      throw ServerFailure(
          message: "=================== Server error =======================");
    }
  }
}
