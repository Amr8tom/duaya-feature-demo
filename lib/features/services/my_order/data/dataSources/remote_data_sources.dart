import 'package:duaya_app/features/services/my_order/data/model/order_details.dart';
import 'package:duaya_app/utils/constants/api_constants.dart';

import '../../../../../../utils/dio/dio_helper.dart';
import '../model/all_orders_model.dart';
import '../model/all_refund_request_model.dart';
import '../model/order_items_model.dart';
import '../model/send_refund_request_model.dart';

abstract class OrderRemoteDataSources {
  Future<AllOrdersModel> getAllOrders();
  Future<OrderDetails> getOrderDetails({required String orderID});
  Future<OrderItemsModel> getOrderItemsModel({required String orderID});
  Future<AllRefundRequestModel> getAllRefundRequests();
  Future<SendRefundRequestModel> sendRefundRequestModel(
      {required Map<String, dynamic> params});
}

class OrderRemoteDataSourcesImp implements OrderRemoteDataSources {
  final DioHelper dio;
  OrderRemoteDataSourcesImp(this.dio);
  @override
  Future<AllOrdersModel> getAllOrders() async {
    final response = await dio.getData(URL: URL.getAllOrders);
    print("================================================> $response");
    return AllOrdersModel.fromJson(response);
  }

  Future<OrderDetails> getOrderDetails({required String orderID}) async {
    final response = await dio.getData(URL: "${URL.getOrderDetails}$orderID");
    print("================================================> $response");
    return OrderDetails.fromJson(response);
  }

  @override
  Future<OrderItemsModel> getOrderItemsModel({required String orderID}) async {
    final response = await dio.getData(URL: "${URL.getOrderItems}$orderID");
    print("================================================> $response");
    return OrderItemsModel.fromJson(response);
  }

  @override
  Future<AllRefundRequestModel> getAllRefundRequests() async {
    final response = await dio.getData(URL: "${URL.getAllRefundOrderRequest}");
    print("================================================> $response");
    return AllRefundRequestModel.fromJson(response);
  }

  @override
  Future<SendRefundRequestModel> sendRefundRequestModel(
      {required Map<String, dynamic> params}) async {
    final response =
        await dio.postData(URL: "${URL.sendRefundOrderRequest}", body: params);
    print("================================================> $response");
    return SendRefundRequestModel.fromJson(response);
  }
}
