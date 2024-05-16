part of 'companies_by_page_cubit.dart';

@immutable
sealed class CompaniesByPageState {}

final class CompaniesByPageInitial extends CompaniesByPageState {}

final class CompaniesByPageSuccess extends CompaniesByPageState {}

final class FetchCompanyDataSuccess extends CompaniesByPageState {}

final class FetchCompanyDataLoading extends CompaniesByPageState {}
