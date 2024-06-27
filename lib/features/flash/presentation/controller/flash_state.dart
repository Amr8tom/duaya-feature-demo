part of 'flash_cubit.dart';

@immutable
sealed class FlashState {}

final class FlashInitial extends FlashState {}

final class FlashLoadingState extends FlashState {}

final class FlashSuccessState extends FlashState {}

final class FlashTodayLoadingState extends FlashState {}

final class FlashTodaySuccessState extends FlashState {}

final class FlashTodayCertianComanySuccessState extends FlashState {}

final class FlashTodayCertianComanyLoadingState extends FlashState {}
