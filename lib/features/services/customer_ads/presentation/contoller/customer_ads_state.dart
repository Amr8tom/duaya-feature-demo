part of 'customer_ads_cubit.dart';

@immutable
sealed class CustomerAdsState {}

final class CustomerAdsInitial extends CustomerAdsState {}

final class CustomerAdsLoading extends CustomerAdsState {}

final class CustomerAdsSuccess extends CustomerAdsState {}

final class CustomerAdsFailure extends CustomerAdsState {}
