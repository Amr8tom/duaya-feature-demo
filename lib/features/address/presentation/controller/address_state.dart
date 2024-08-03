part of 'address_cubit.dart';

@immutable
abstract class AddressState {}

class AddressInitial extends AddressState {}

class AddressSubmitting extends AddressState {}

class AddressCreateNewLoading extends AddressState {}

class AddressCreateNewSuccess extends AddressState {}

class AddressUpdateNewLoadind extends AddressState {}

class AddressUpdateNewSuccess extends AddressState {}

class AddressGetCountry extends AddressState {}

class AddressSubmitted extends AddressState {}

class AddressGeLocationRegion extends AddressState {}

class AddressGeLocationCity extends AddressState {}

class AddressToggleCity extends AddressState {}

class AddressListLoading extends AddressState {}

class AddressListLoaded extends AddressState {}

class AddressListError extends AddressState {}

class AddressListDeleteError extends AddressState {}

class AddressListDeleteSuccess extends AddressState {}

class AddressListToggleFalse extends AddressState {}

class AddressListToggleTrue extends AddressState {}

class AddressSetSelectedLoading extends AddressState {}

class AddressSetSelectedSuccess extends AddressState {}

class FetchAddressListDataLoading extends AddressState {}

class FetchAddressListDataSuccess extends AddressState {}

class AddressError extends AddressState {}
