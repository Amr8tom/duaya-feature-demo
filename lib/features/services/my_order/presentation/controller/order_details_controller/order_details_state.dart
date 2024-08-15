part of 'order_details_cubit.dart';

@immutable
sealed class OrderDetailsState {}

final class OrderDetailsInitial extends OrderDetailsState {}

final class OrderDetailsSuccessed extends OrderDetailsState {
  final OrderDetails orderDetails;
  OrderDetailsSuccessed({required this.orderDetails});
}

final class OrderDetailsLoading extends OrderDetailsState {}

final class OrderDetailsFailure extends OrderDetailsState {}
