import 'package:dio/dio.dart';
import 'package:duaya_app/utils/constants/api_constants.dart';
import 'package:duaya_app/utils/dio/dio_helper.dart';

class addressRemoteDataSoureces {
  Future<Map<String, dynamic>?> createAddressData(
      {required Map<String, dynamic> addressBody}) {
    DioHelper API = DioHelper();
    Future<Map<String, dynamic>?> response =
        API.postData(URL: URL.createAddress, body: addressBody);
    return response;
  }

  Future<Map<String, dynamic>?> updateAddressData(
      {required Map<String, dynamic> addressBody}) {
    DioHelper API = DioHelper();
    Future<Map<String, dynamic>?> response =
        API.postData(URL: URL.updateAddress, body: addressBody);
    return response;
  }

  /// updateAddress in Cart to send the address data to the backend
  Future<Map<String, dynamic>?> updateAddressInCart(
      {required Map<String, dynamic> addressBody}) {
    DioHelper API = DioHelper();
    Future<Map<String, dynamic>?> response =
        API.postData(URL: URL.updateAddressInCart, body: addressBody);
    return response;
  }

  Future<Map<String, dynamic>?> chooseAddressData(
      {required Map<String, dynamic> addressBody}) {
    DioHelper API = DioHelper();
    Future<Map<String, dynamic>?> response =
        API.postData(URL: URL.makeDefaultAddress, body: addressBody);
    return response;
  }

  Future<Map<String, dynamic>?> getAddressListData() {
    DioHelper API = DioHelper();
    Future<Map<String, dynamic>?> response =
        API.getData(URL: URL.getAddressList);
    return response;
  }

  Future<Map<String, dynamic>?> deleteAddressfromList({required String ID}) {
    DioHelper API = DioHelper();
    Future<Map<String, dynamic>?> response =
        API.getData(URL: "${URL.deleteAddress}$ID");
    return response;
  }
}
