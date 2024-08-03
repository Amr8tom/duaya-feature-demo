part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchSuccess extends SearchState {}

final class SearchTurnOffLoading extends SearchState {}

final class SearchTurnOffSuccess extends SearchState {}

final class SearchTurnOnSuccess extends SearchState {}

final class SearchTurnOnLoading extends SearchState {}

final class SearchDeleteLoading extends SearchState {}

final class SearchDeleteSuccess extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchFaliure extends SearchState {}
