part of 'auth_controller_cubit.dart';

@immutable
sealed class AuthControllerState {}

final class AuthControllerInitial extends AuthControllerState {}

final class AuthControllerloading extends AuthControllerState {}

final class AuthControllerloadingSuccess extends AuthControllerState {}

final class AuthControllerSuccess extends AuthControllerState {}

final class AuthControllerError extends AuthControllerState {}

final class AuthControllerTogglePassword extends AuthControllerState {}

final class AuthControllerToggleCity extends AuthControllerState {}

final class AuthControllerToggleRigon extends AuthControllerState {}
