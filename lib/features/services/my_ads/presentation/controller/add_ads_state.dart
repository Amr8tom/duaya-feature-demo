part of 'add_ads_cubit.dart';

@immutable
sealed class AddAdsState {}

final class AddAdsInitial extends AddAdsState {}

final class AddAdsSuccess extends AddAdsState {
  // final AddAdModel adModel;
  // AddAdsSuccess({required this.adModel});
}

final class AddAdsFailure extends AddAdsState {}

final class AddAdsLoading extends AddAdsState {}
