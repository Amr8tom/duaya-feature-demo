part of 'my_orders_cubit.dart';

@immutable
sealed class MyOrdersState {}

final class MyOrdersInitial extends MyOrdersState {}

final class MyOrdersLoading extends MyOrdersState {}

final class MyOrdersError extends MyOrdersState {}

final class MyOrdersSuccess extends MyOrdersState {
  final AllOrdersModel ordersModel;

  MyOrdersSuccess({required this.ordersModel});
}
