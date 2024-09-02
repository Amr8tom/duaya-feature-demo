part of 'orer_items_cubit.dart';

@immutable
sealed class OrerItemsState {}

final class OrerItemsFailure extends OrerItemsState {}

final class OrerItemsSuccess extends OrerItemsState {
  final OrderItemsModel orderItems;
  OrerItemsSuccess({required this.orderItems});
}

final class OrerItemsLoading extends OrerItemsState {}
