part of 'order_refund_controller_cubit.dart';

@immutable
sealed class OrderRefundControllerState {}

final class OrderRefundControllerloading extends OrderRefundControllerState {}

final class OrderRefundControllerSuccessed extends OrderRefundControllerState {}

final class OrderRefundControllerFailure extends OrderRefundControllerState {}
