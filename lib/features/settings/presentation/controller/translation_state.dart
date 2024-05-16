part of 'translation_cubit.dart';

@immutable
sealed class TranslationState {}

final class TranslationInitial extends TranslationState {}

final class nextTranslation extends TranslationState {}
