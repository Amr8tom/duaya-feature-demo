import 'package:dartz/dartz.dart';
import 'package:duaya_app/utils/error/failure.dart';

import '../../data/model/all_orders_model.dart';

abstract class OrdersRepo {
  Future<Either<Failure, AllOrdersModel>> GetAllOrders();
}
