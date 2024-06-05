import 'package:bloc/bloc.dart';
import 'package:duaya_app/common/common_snak_bar_widget.dart';
import 'package:duaya_app/features/cart/presentation/widgets/controller/cart_cubit.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../authentication/data/model/citiesModel.dart';
import '../../../authentication/data/repositories/registerRepo.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());

  final TextEditingController addressController = TextEditingController();
  final TextEditingController countryIdController = TextEditingController();
  final TextEditingController stateIdController = TextEditingController();
  final TextEditingController cityIdController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool addressError = false;
  bool countryIdError = false;
  bool stateIdError = false;
  bool cityIdError = false;
  bool postalCodeError = false;
  bool phoneError = false;
  bool noErrors = false;
  CitiesModel citiesModel = CitiesModel();
  Map<String, String> citiesMap = {};
  Map<String, List<String>?> regionsMap = {};
  String? selectWork = S.current.pharmacy;
  String selectedCity = "";
  String? selectedCityByName = 'الاسكندرية';
  String selectedRegion = "";
  String currentCountry = S.current.loading;
  String currentCity = S.current.loading;

  Future<void> fetchLocationsData() async {
    await _getCurrentLocation();
    // await _getCurrentCity();
    regionsMap.clear();
    citiesMap.clear();
    // rigsterRepositoryImpl repo = rigsterRepositoryImpl();
    // citiesModel = await repo.getCitiesModel();
    // citiesModel.data!.forEach((element) {
    //   citiesMap[element.name.toString()] = element.id.toString();
    //   regionsMap[element.name.toString()] = element.regions;
    //   print(regionsMap[selectedCityByName]);
    // }
    // );
    emit(AddressGetCountry());
  }

  void setSelectedCity({required String cityValue, required String cityID}) {
    selectedCityByName = cityValue;
    selectedCity = cityID;
    emit(AddressToggleCity());
  }

  onAddressSubmitted({required BuildContext context}) {
    addressError = false;
    countryIdError = false;
    stateIdError = false;
    cityIdError = false;
    postalCodeError = false;
    phoneError = false;
    if (addressController.text.trim().isEmpty) {
      addressError = true;
    }
    if (countryIdController.text.trim().isEmpty) {
      countryIdError = true;
    }
    if (stateIdController.text.trim().isEmpty) {
      stateIdError = true;
    }
    if (cityIdController.text.trim().isEmpty) {
      cityIdError = true;
    }
    if (postalCodeController.text.trim().isEmpty) {
      postalCodeError = true;
    }
    if (postalCodeController.text.trim().isEmpty) {
      phoneError = true;
    }

    if (addressError ||
        cityIdError ||
        stateIdError ||
        cityIdError ||
        postalCodeError ||
        phoneError) {
      noErrors = false;
      commonToast(S.current.pleaseEndterValue);
    } else {
      noErrors = true;
    }
    emit(AddressSubmitting());
  }

  /// Get Current Country
  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placeMarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      String country = placeMarks.first.country ?? S.current.unknown;
      currentCountry = country;
    } catch (e) {
      print("Error getting location: $e");
      emit(AddressGeLocationRegion());
    }
  }

  /// Get Current City
  Future<void> _getCurrentCity() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placeMarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      String city = placeMarks.first.administrativeArea ??
          S.current.unknown; // Extracting the city
      currentCity = city;
    } catch (e) {
      print("Error getting location: $e");
    }
    emit(AddressGeLocationCity());
  }
}
