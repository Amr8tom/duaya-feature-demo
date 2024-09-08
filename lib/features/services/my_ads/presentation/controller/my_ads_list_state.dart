part of 'my_ads_list_cubit.dart';

@immutable
sealed class MyAdsListState {}

final class MyAdsListInitial extends MyAdsListState {}

final class MyAdsListLoading extends MyAdsListState {}

final class MyAdsListSuccess extends MyAdsListState {
  final MyAdsListModel myAds;
  MyAdsListSuccess({required this.myAds});
}

final class MyAdsListFailure extends MyAdsListState {}
