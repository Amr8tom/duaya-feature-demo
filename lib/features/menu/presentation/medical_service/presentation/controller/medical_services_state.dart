part of 'medical_services_cubit.dart';

@immutable
sealed class MedicalServicesState {}

final class MedicalServicesInitial extends MedicalServicesState {}

final class MedicalServicesGetListSuccess extends MedicalServicesState {}

final class MedicalServicesGetListLoading extends MedicalServicesState {}
