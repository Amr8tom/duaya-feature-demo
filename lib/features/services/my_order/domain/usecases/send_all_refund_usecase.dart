import 'package:duaya_app/features/services/my_order/data/model/send_refund_request_model.dart';
import 'package:duaya_app/features/services/my_order/domain/repositories/repositories.dart';

class SendAllRefundUsecase {
  final OrdersRepo repository;
  SendAllRefundUsecase(this.repository);

  Future<SendRefundRequestModel> call(
      {required Map<String, dynamic> params}) async {
    return repository.sendRefundRequest(params: params);
  }
}
