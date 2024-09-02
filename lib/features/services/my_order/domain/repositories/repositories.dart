import 'package:dartz/dartz.dart';
import 'package:duaya_app/features/services/my_order/data/model/order_details.dart';
import 'package:duaya_app/features/services/my_order/data/model/order_items_model.dart';
import 'package:duaya_app/utils/error/failure.dart';

import '../../data/model/all_orders_model.dart';
import '../../data/model/all_refund_request_model.dart';
import '../../data/model/send_refund_request_model.dart';

abstract class OrdersRepo {
  Future<Either<Failure, AllOrdersModel>> GetAllOrders();
  Future<Either<Failure, OrderDetails>> getOrderDetails(
      {required String orderID});
  Future<Either<Failure, OrderItemsModel>> getOrderItems(
      {required String orderID});
  Future<Either<Failure, AllRefundRequestModel>> getOrderRefundRequest();
  Future<SendRefundRequestModel> sendRefundRequest(
      {required Map<String, dynamic> params});
}
