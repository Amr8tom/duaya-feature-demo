part of 'customer_ads_cubit.dart';

@immutable
sealed class CustomerAdsState {}

final class CustomerAdsInitial extends CustomerAdsState {}

final class CustomerAdsLoading extends CustomerAdsState {}

final class CustomerAdsDetailsSuccess extends CustomerAdsState {
  final AdDetailsModel adDetailsModel;
  CustomerAdsDetailsSuccess({required this.adDetailsModel});
}

final class CustomerAdsSuccess extends CustomerAdsState {
  final GetAllCustomerAds customerAds;
  CustomerAdsSuccess({required this.customerAds});
}

final class CustomerAdsFailure extends CustomerAdsState {}
