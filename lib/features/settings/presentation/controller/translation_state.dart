part of 'translation_cubit.dart';

@immutable
sealed class TranslationState {}

final class TranslationInitial extends TranslationState {}

final class nextTranslation extends TranslationState {}

final class LogOutLoading extends TranslationState {}

final class AvatarSuccess extends TranslationState {}

final class AvatarLoading extends TranslationState {}

final class fetchProfileDataSuccess extends TranslationState {}

final class fetchProfileDataLoading extends TranslationState {}

final class LogOutSuccess extends TranslationState {}
