part of 'update_profile_cubit.dart';

@immutable
sealed class UpdateProfileState {}

final class UpdateProfileInitial extends UpdateProfileState {}

final class UpdateProfileFetchDataLoading extends UpdateProfileState {}

final class UpdateProfileFetchDataSuccess extends UpdateProfileState {}

final class UpdateProfileFetchDataFailure extends UpdateProfileState {}

final class UpdateProfileImageLoading extends UpdateProfileState {}

final class UpdateProfileImageSuccess extends UpdateProfileState {}

final class UpdateProfileSelectCountryLoading extends UpdateProfileState {}

final class UpdateProfileSelectCountrySuccess extends UpdateProfileState {}

final class UpdateProfileSelectCityLoading extends UpdateProfileState {}

final class UpdateProfileSelectCitySuccess extends UpdateProfileState {}

final class UpdateProfileSelectStateLoading extends UpdateProfileState {}

final class UpdateProfileSelectStateSuccess extends UpdateProfileState {}
