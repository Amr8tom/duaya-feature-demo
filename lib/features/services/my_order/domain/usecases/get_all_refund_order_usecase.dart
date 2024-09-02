import 'package:dartz/dartz.dart';
import 'package:duaya_app/features/services/my_order/data/model/all_refund_request_model.dart';
import 'package:duaya_app/features/services/my_order/domain/repositories/repositories.dart';
import 'package:duaya_app/utils/error/failure.dart';

class GetAllRefundOrderUsecase {
  final OrdersRepo repository;
  GetAllRefundOrderUsecase(this.repository);
  Future<Either<Failure, AllRefundRequestModel>> call() async {
    return repository.getOrderRefundRequest();
  }
}
