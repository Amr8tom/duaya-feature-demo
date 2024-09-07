import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/src/response.dart';
import 'package:duaya_app/common/common_snak_bar_widget.dart';
import 'package:duaya_app/features/cart/data/dataSources/cartLocalDataSource.dart';
import 'package:duaya_app/features/cart/data/model/cartCount.dart';
import 'package:duaya_app/features/cart/data/model/cartSummary.dart';
import 'package:duaya_app/features/cart/data/model/checkOutModel.dart';
import 'package:duaya_app/features/cart/data/model/deleteModel.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/connection/checkNetwork.dart';
import '../dataSources/cartRemoteDataSource.dart';
import '../model/ChangeQuantitiyModel.dart';
import '../model/addToCartModel.dart';
import '../model/cart_model.dart';

class cartRepositoryImpl {
  final cartRemoteDataSources remoteData = cartRemoteDataSources();
  final cartLocalDataSourcesimp localData = cartLocalDataSourcesimp();
  cartRepositoryImpl();

  Future<addToCartModel?> addToCart(
      {required Map<String, dynamic> cartBody}) async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      print("///////// Net Connected ///////////////");
      Map<String, dynamic>? response =
          await remoteData.addToCart(cartBody: cartBody);
      print(cartBody);
      print('response ====================>>>> $response');
      return addToCartModel.fromJson(response);
    } else {
      commonToast(S.current.NoInternetConnection);
    }
  }

  Future<DeleteModel?> deleteCart({required int cartID}) async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      print("///////// Net Connected ///////////////");
      Response response = await remoteData.deleteCartItem(cartID: cartID);
      return DeleteModel.fromJson(response.data);
    } else {
      commonToast(S.current.NoInternetConnection);
    }
  }

  Future<CheckOutModel?> checkOut(
      {required Map<String, dynamic> checkOutBody}) async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      print("/////////////////   Net Connected    ///////////////");
      Map<String, dynamic>? response =
          await remoteData.checkOut(checkOutBody: checkOutBody);
      print(response);
      print("response");
      return CheckOutModel.fromJson(response);
    } else {
      commonToast(S.current.NoInternetConnection);
    }
  }

  Future<ChangeQuantitiyModel?> chaneQuantitiy(
      {required Map<String, dynamic> quantitiyBody}) async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      print("/////////////////   Net Connected    ///////////////");
      Map<String, dynamic>? response =
          await remoteData.changeQiantity(quantitiyBody: quantitiyBody);
      return ChangeQuantitiyModel.fromJson(response);
    } else {
      commonToast(S.current.NoInternetConnection);
    }
  }

  Future<CartSummary> getCartSummary() async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      print(
          "////////////////////////   Net Connected  ////////////////////////");
      Map<String, dynamic>? response = await remoteData.cartSummary();
      return CartSummary.fromJson(response);
    } else {
      String response = await localData.getCartCount();
      return CartSummary.fromJson(response);
    }
  }

  Future<CartCount> getCartCount() async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      print(
          "/////////////////////////   Net Connected  ///////////////////////////////////");
      final response = await remoteData.cartCount();
      return CartCount.fromJson(response);
    } else {
      String response = await localData.getCartCount();
      return CartCount.fromJson(response);
    }
  }

  Future<CartModel> getCartItems() async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      print(
          "/////////////////////////   Net Connected  ///////////////////////////////////");
      final response = await remoteData.getCartItems();
      return CartModel.fromJson(response);
    } else {
      String response = await localData.getCartItems();
      return CartModel.fromJson(response);
    }
  }
}
