part of 'expired_products_cubit.dart';

@immutable
sealed class ExpiredProductsState {}

final class ExpiredProductsInitial extends ExpiredProductsState {}

final class ExpiredProductsListSuccess extends ExpiredProductsState {}

final class ExpiredProductsListLoading extends ExpiredProductsState {}

final class ExpiredProductsCreateSuccess extends ExpiredProductsState {}

final class ExpiredProductsCreateLoading extends ExpiredProductsState {}

final class ExpiredProductsUpdateSuccess extends ExpiredProductsState {}

final class ExpiredProductsUpdateLoading extends ExpiredProductsState {}

final class ExpiredProductsDeleteSuccess extends ExpiredProductsState {}

final class ExpiredProductsDeleteLoading extends ExpiredProductsState {}

final class ExpiredProductsSibmitFaliure extends ExpiredProductsState {}

final class ExpiredProductsSibmitSuccess extends ExpiredProductsState {}
