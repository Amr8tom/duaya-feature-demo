part of 'gift_cubit.dart';

@immutable
abstract class GiftState {}

class GiftInitial extends GiftState {}

class GiftILoadingData extends GiftState {}

class GiftISuccessData extends GiftState {}

class GiftINoData extends GiftState {}
