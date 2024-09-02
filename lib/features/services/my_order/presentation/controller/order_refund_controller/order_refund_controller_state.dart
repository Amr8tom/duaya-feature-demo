part of 'order_refund_controller_cubit.dart';

@immutable
sealed class OrderRefundControllerState {}

final class OrderRefundControllerInitial extends OrderRefundControllerState {}

final class OrderRefundControllerloading extends OrderRefundControllerState {}

final class OrderRefundControllerSuccessed extends OrderRefundControllerState {
  final SendRefundRequestModel? sendRefundModel;
  final AllRefundRequestModel? refundRequestsModel;
  OrderRefundControllerSuccessed(
      {this.refundRequestsModel, this.sendRefundModel});
}

final class OrderRefundControllerFailure extends OrderRefundControllerState {}
