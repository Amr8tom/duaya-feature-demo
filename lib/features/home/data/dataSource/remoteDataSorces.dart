import 'package:dio/dio.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/api_constants.dart';
import 'package:duaya_app/utils/dio/dio_helper.dart';

class bestSellerRemoteDataSoureces {
  DioHelper API = DioHelper();
  bestSellerRemoteDataSoureces();
  Future<Map<String, dynamic>?> getBestSellerData() {
    Future<Map<String, dynamic>?> response = API.getData(URL: URL.bestSellers);
    return response;
  }

  Future<Map<String, dynamic>?> getSliders() {
    Future<Map<String, dynamic>?> response = API.getData(URL: URL.sliders);
    return response;
  }

  Future<Map<String, dynamic>?> getProductDetails({required String productID}) {
    Future<Map<String, dynamic>?> response =
        API.getData(URL: "${URL.product}$productID");
    return response;
  }

  Future<Map<String, dynamic>?> getRelatedProduct({required String productID}) {
    Future<Map<String, dynamic>?> response =
        API.getData(URL: "${URL.relatedProduct}$productID");
    return response;
  }
}
