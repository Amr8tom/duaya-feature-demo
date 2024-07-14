part of 'auth_controller_cubit.dart';

@immutable
sealed class AuthControllerState {}

final class AuthControllerInitial extends AuthControllerState {}

final class AuthControllerloading extends AuthControllerState {}

final class AuthControllerloadingSuccess extends AuthControllerState {}

final class AuthControllerSuccess extends AuthControllerState {}

final class AuthControllerToggleRegion extends AuthControllerState {}

final class AuthControllerError extends AuthControllerState {}

final class AuthControllerTogglePassword extends AuthControllerState {}

final class AuthControllerToggleCity extends AuthControllerState {}

final class AuthControllerToggleCheckBoxFalse extends AuthControllerState {}

final class AuthControllerToggleCheckBoxTrue extends AuthControllerState {}

final class AuthControllerToggleRigon extends AuthControllerState {}

final class AuthControllerStateLoading extends AuthControllerState {}

final class AuthControllerStateSuccess extends AuthControllerState {}

final class AuthControllerCityLoading extends AuthControllerState {}

final class AuthControllerCitySuccess extends AuthControllerState {}
