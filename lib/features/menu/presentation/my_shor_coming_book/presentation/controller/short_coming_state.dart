part of 'short_coming_cubit.dart';

@immutable
sealed class ShortComingState {}

final class ShortComingInitial extends ShortComingState {}

final class SelectImageStudioLoading extends ShortComingState {}

final class SelectImageStudioSuccess extends ShortComingState {}

final class TakeImageStudioLoading extends ShortComingState {}

final class TakeImageStudioSuccess extends ShortComingState {}
