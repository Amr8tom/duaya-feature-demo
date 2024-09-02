import 'dart:async';
import 'dart:convert';
import '../../../../../../utils/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../../../../utils/local_storage/cach_keys.dart';
import '../../../../../../utils/local_storage/cache_helper.dart';
import '../model/all_orders_model.dart';
import '../model/all_refund_request_model.dart';
import '../model/order_details.dart';
import '../model/order_items_model.dart';

abstract class OrderLocalDataSource {
  Future<Unit> cacheOrders({required AllOrdersModel orders});
  Future getOrders();
  Future<Unit> cacheOrderDetails({required OrderDetails details});
  Future getOrderDetails();
  Future<Unit> cacheOrderItems({required OrderItemsModel orderItems});
  Future<OrderItemsModel> getCahcedOrderItmes();
  Future<Unit> cacheAllRefundRequest(
      {required AllRefundRequestModel refundOrder});
  Future<AllRefundRequestModel> getAllRefundeRequest();
}

class OrderLocalDataSourceImp implements OrderLocalDataSource {
  OrderLocalDataSourceImp();
  @override
  Future<Unit> cacheOrders({required AllOrdersModel orders}) async {
    final String cachedOrders = jsonEncode(orders);
    await PrefService.putString(key: CacheKeys.orders, value: cachedOrders);
    return Future.value(unit);
  }

  @override
  Future getOrders() async {
    final jsonString = PrefService.getString(key: CacheKeys.orders);
    if (jsonString != null) {
      final decodedJson = await json.decode(jsonString);
      return decodedJson;
    } else {
      print("fffffffffffffffffffffff");

      throw CacheFailure();
    }
  }

  @override
  Future<Unit> cacheOrderDetails({required OrderDetails details}) async {
    final String cachedDetails = jsonEncode(details);
    PrefService.putString(key: CacheKeys.orderDetails, value: cachedDetails);
    return Future.value(unit);
  }

  @override
  Future getOrderDetails() {
    final jsonString = PrefService.getString(key: CacheKeys.orderDetails);
    if (jsonString != null) {
      final json = jsonDecode(jsonString);
      return Future.value(json);
    } else {
      throw CacheFailure();
    }
  }

  @override
  Future<Unit> cacheOrderItems({required OrderItemsModel orderItems}) {
    final String cachedOrderItems = jsonEncode(orderItems);
    PrefService.putString(key: CacheKeys.orderItems, value: cachedOrderItems);
    return Future.value(unit);
  }

  @override
  Future<OrderItemsModel> getCahcedOrderItmes() {
    final jsonString = PrefService.getString(key: CacheKeys.orderItems);
    if (jsonString != null) {
      final orderItems = jsonDecode(jsonString);
      return Future.value(orderItems);
    } else {
      throw CacheFailure();
    }
  }

  @override
  Future<Unit> cacheAllRefundRequest(
      {required AllRefundRequestModel refundOrder}) async {
    final String cachedRefundRequests = jsonEncode(refundOrder);
    PrefService.putString(
        key: CacheKeys.refundOrderRequests, value: cachedRefundRequests);
    return Future.value(unit);
  }

  @override
  Future<AllRefundRequestModel> getAllRefundeRequest() {
    final jsonString =
        PrefService.getString(key: CacheKeys.refundOrderRequests);
    if (jsonString != null) {
      final refundOrderRequest = jsonDecode(jsonString);
      return Future.value(refundOrderRequest);
    } else {
      throw CacheFailure();
    }
  }
}
