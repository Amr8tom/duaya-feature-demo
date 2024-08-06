import 'package:dartz/dartz.dart';
import 'package:duaya_app/utils/error/failure.dart';

import '../../data/model/all_orders_model.dart';
import '../repositories/repositories.dart';

class GetAllOrdersUseCase {
  final OrdersRepo repository;
  GetAllOrdersUseCase(this.repository);

  Future<Either<Failure, AllOrdersModel>> call() async {
    return repository.GetAllOrders();
  }
}
