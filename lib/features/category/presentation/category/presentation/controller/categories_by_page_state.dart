part of 'categories_by_page_cubit.dart';

@immutable
sealed class CategoriesByPageState {}

final class CategoriesByPageInitial extends CategoriesByPageState {}

final class CategoriesByPageSuccess extends CategoriesByPageState {}

final class CategoriesGetIDsSuccess extends CategoriesByPageState {}

final class CategoriesGetIDsLoading extends CategoriesByPageState {}

final class CategoryByIDLoading extends CategoriesByPageState {}

final class CategoryByIDSuccess extends CategoriesByPageState {}
