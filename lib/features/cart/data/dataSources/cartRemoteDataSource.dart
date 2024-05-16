import 'package:dio/src/response.dart';
import 'package:duaya_app/utils/constants/api_constants.dart';
import 'package:duaya_app/utils/dio/dio_helper.dart';

class cartRemoteDataSources {
  cartRemoteDataSources();

  DioHelper API = DioHelper();

  Future<Map<String, dynamic>?> addToCart(
      {required Map<String, dynamic> cartBody}) async {
    Future<Map<String, dynamic>?> response =
        API.postData(URL: URL.addToCart, body: cartBody);
    return response;
  }

  Future<Map<String, dynamic>?> checkOut(
      {required Map<String, dynamic> checkOutBody}) async {
    Map<String, dynamic>? response =
        await API.postData(URL: URL.checkOut, body: checkOutBody);
    return response;
  }

  Future<Map<String, dynamic>?> changeQiantity(
      {required Map<String, dynamic> quantitiyBody}) async {
    Future<Map<String, dynamic>?> response =
        API.postData(URL: URL.changeQuantitiy, body: quantitiyBody);
    return response;
  }

  Future<Map<String, dynamic>?> cartSummary() async {
    Future<Map<String, dynamic>?> response = API.getData(URL: URL.summary);
    return response;
  }

  Future<Map<String, dynamic>> cartCount() async {
    Map<String, dynamic>? response = await API.getData(URL: URL.cartCount);
    return response!;
  }

  Future<Map<String, dynamic>> getCartItems() async {
    Map<String, dynamic>? response = await API.postData(URL: URL.listCartItems);
    return response!;
  }

  Future<Response> deleteCartItem({required int cartID}) async {
    Response response = await API.deleteData(URL: "${URL.deleteCart}$cartID");
    return response!;
  }
}
