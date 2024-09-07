import 'package:dartz/dartz.dart';
import 'package:duaya_app/features/services/my_order/data/model/all_refund_request_model.dart';
import 'package:duaya_app/features/services/my_order/data/model/order_details.dart';
import 'package:duaya_app/features/services/my_order/data/model/order_items_model.dart';
import 'package:duaya_app/features/services/my_order/data/model/send_refund_request_model.dart';
import 'package:duaya_app/utils/connection/checkNetwork.dart';
import '../../../../../../utils/error/failure.dart';
import '../../domain/repositories/repositories.dart';
import '../dataSources/local_data_sources.dart';
import '../dataSources/remote_data_sources.dart';
import '../model/all_orders_model.dart';

class OrdersRepoImp implements OrdersRepo {
  final OrderLocalDataSource localDataSource;
  final OrderRemoteDataSources remoteDataSource;
  final NetworkInfo networkInfo;
  OrdersRepoImp(
      {required this.localDataSource,
      required this.remoteDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, AllOrdersModel>> GetAllOrders() async {
    if (await networkInfo.isConnected) {
      try {
        final orders = await remoteDataSource.getAllOrders();
        localDataSource.cacheOrders(orders: orders);
        return Right(orders);
      } on ServerFailure {
        return left(ServerFailure(
            message:
                '======== serever Faluire is working=========================='));
      }
    } else {
      try {
        final orders = await localDataSource.getOrders();
        print("orders================>$orders");
        return right(AllOrdersModel.fromJson(orders));
      } on CacheFailure {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, OrderDetails>> getOrderDetails(
      {required String orderID}) async {
    if (await networkInfo.isConnected) {
      try {
        final orderDetails =
            await remoteDataSource.getOrderDetails(orderID: orderID);
        localDataSource.cacheOrderDetails(details: orderDetails);
        return Right(orderDetails);
      } on ServerFailure {
        return left(ServerFailure(
            message:
                '======== serever Faluire is working=========================='));
      }
    } else {
      try {
        final orderDetails = await localDataSource.getOrderDetails();
        print("orders================>$orderDetails");
        return right(OrderDetails.fromJson(orderDetails));
      } on CacheFailure {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, OrderItemsModel>> getOrderItems(
      {required String orderID}) async {
    if (await networkInfo.isConnected) {
      try {
        final orderItems =
            await remoteDataSource.getOrderItemsModel(orderID: orderID);
        localDataSource.cacheOrderItems(orderItems: orderItems);
        return right(orderItems);
      } on ServerFailure {
        return left(ServerFailure(
            message:
                '======== serever Faluire is working=========================='));
      }
    } else {
      try {
        final orderItems = localDataSource.getCahcedOrderItmes();
        return right(OrderItemsModel.fromJson(orderItems));
      } on CacheFailure {
        return left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, AllRefundRequestModel>> getOrderRefundRequest() async {
    if (await networkInfo.isConnected) {
      try {
        final refundOrdersRequests =
            await remoteDataSource.getAllRefundRequests();
        localDataSource.cacheAllRefundRequest(
            refundOrder: refundOrdersRequests);
        return right(refundOrdersRequests);
      } on ServerFailure {
        return left(ServerFailure(
            message:
                '======== serever Faluire is working=========================='));
      }
    } else {
      try {
        final refundOrderRequests = localDataSource.getAllRefundeRequest();
        return right(AllRefundRequestModel.fromJson(refundOrderRequests));
      } on CacheFailure {
        return left(CacheFailure());
      }
    }
  }

  @override
  Future<SendRefundRequestModel> sendRefundRequest(
      {required Map<String, dynamic> params}) async {
    try {
      final sendRefundRequest =
          await remoteDataSource.sendRefundRequestModel(params: params);
      return sendRefundRequest;
    } on ServerFailure {
      throw ServerFailure(
          message: "======== serever Faluire =======================");
    }
  }
}
