import 'package:dartz/dartz.dart';
import 'package:duaya_app/features/services/my_order/data/model/order_items_model.dart';
import 'package:duaya_app/features/services/my_order/domain/repositories/repositories.dart';
import 'package:duaya_app/utils/error/failure.dart';

class GetOrderItemsUsecase {
  final OrdersRepo repository;
  GetOrderItemsUsecase(this.repository);

  Future<Either<Failure, OrderItemsModel>> call(
      {required String orderID}) async {
    return repository.getOrderItems(orderID: orderID);
  }
}
