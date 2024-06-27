part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartAddSucess extends CartState {}

final class CheckOutSuccess extends CartState {}

final class UpdatedDataSuccess extends CartState {}

final class SaveDataSuccess extends CartState {}

final class AddToCartSuccess extends CartState {}

final class DeleteCartSuccess extends CartState {}

final class FetechCartDataSuccess extends CartState {}

final class ClacTotalSummary extends CartState {}

final class CartAddfailure extends CartState {}

final class CartMinysfailure extends CartState {}

final class CartMinusSucess extends CartState {}
