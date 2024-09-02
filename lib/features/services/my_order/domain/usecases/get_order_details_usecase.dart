import 'package:dartz/dartz.dart';
import 'package:duaya_app/features/services/my_order/data/model/order_details.dart';
import 'package:duaya_app/utils/error/failure.dart';
import '../repositories/repositories.dart';

class GetOrderDetailsUsecase {
  final OrdersRepo repository;
  GetOrderDetailsUsecase(this.repository);

  Future<Either<Failure, OrderDetails>> call({required String orderID}) async {
    return repository.getOrderDetails(orderID: orderID);
  }
}
