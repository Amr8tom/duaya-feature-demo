part of 'address_cubit.dart';

@immutable
abstract class AddressState {}

class AddressInitial extends AddressState {}

class AddressSubmitting extends AddressState {}

class AddressGetCountry extends AddressState {}

class AddressSubmitted extends AddressState {}

class AddressGeLocationRegion extends AddressState {}

class AddressGeLocationCity extends AddressState {}

class AddressToggleCity extends AddressState {}

class AddressError extends AddressState {
  final String message;
  AddressError(this.message);
}
