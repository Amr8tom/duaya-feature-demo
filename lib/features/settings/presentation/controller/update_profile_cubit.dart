import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:duaya_app/common/common_snak_bar_widget.dart';
import 'package:duaya_app/features/authentication/data/model/CityModel.dart';
import 'package:duaya_app/features/authentication/data/model/StateID.dart';
import 'package:duaya_app/features/authentication/data/model/countryModel.dart';
import 'package:duaya_app/features/settings/data/model/updateProfileModel.dart';
import 'package:duaya_app/features/settings/data/repositories/update_profile_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../../generated/l10n.dart';
import '../../../authentication/data/repositories/registerRepo.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());
  UpdateProfileModel updateProfileModel = UpdateProfileModel();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController job = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cityID = TextEditingController();
  TextEditingController stateID = TextEditingController();
  TextEditingController countryID = TextEditingController();
  XFile? selectedImage;
  Map<String, String> countriesMap = {};
  Map<String, String> citiesMap = {};
  Map<String, String> stateMap = {};
  String? selectedCountry;
  String? selectedCity;
  String? selectedState = null;
  CountryModel countryModel = CountryModel();
  CityModel cityModel = CityModel();
  StateIdModel stateModel = StateIdModel();
  rigsterRepositoryImpl authRepo = rigsterRepositoryImpl();
  UpdateProfileRepositoryImp repo = UpdateProfileRepositoryImp();
  Future<void> fetchUpdataProfile({required BuildContext context}) async {
    emit(UpdateProfileFetchDataLoading());

    /// there is a problem here state is city
    /// and city is the state
    updateProfileModel = await repo.fetchUpdateProfileData(
        updateProfileBody: FormData.fromMap({
      "name": name.text.trim(),
      "phone": phone.text.trim(),
      "job_name": job.text.trim(),
      "password": password.text.trim(),
      "country_id": countryID.text.trim(),
      "state_id": cityID.text.trim(),
      "city_id": stateID.text.trim(),
      "license_img": selectedImage?.path != null
          ? [
              MultipartFile.fromFile(selectedImage!.path,
                  filename: selectedImage!.path.split('/').last)
            ]
          : null
    }));
    updateProfileModel.result == true ? Navigator.pop(context) : null;
    commonToast(updateProfileModel.message ?? S.current.NoInternetConnection);
    emit(UpdateProfileFetchDataSuccess());
  }

  Future<XFile?> getImage() async {
    emit(UpdateProfileImageLoading());
    ImagePicker picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    pickedImage != null ? selectedImage = pickedImage : null;
    emit(UpdateProfileImageSuccess());
  }

  /// get countries
  Future<void> fetchCountries() async {
    emit(UpdateProfileSelectCountryLoading());

    countriesMap.clear();
    countryModel = await authRepo.getCountryModel();
    countryModel.data!.forEach((element) {
      print(element.name);
      countriesMap[element.name.toString()] = element.id.toString();
    });

    emit(UpdateProfileSelectCountrySuccess());
  }

  void setValues({value, required String countryID}) async {
    emit(UpdateProfileSelectCountryLoading());
    selectedCountry = value;
    this.countryID.text = countryID;
    selectedCity = null;
    selectedState = null;
    emit(UpdateProfileSelectCountrySuccess());
  }

  /// get cities
  Future<void> fetchCities({required String countryID}) async {
    emit(UpdateProfileSelectCityLoading());
    stateMap.clear();
    citiesMap.clear();
    cityModel = await authRepo.getCityModel(countryID: countryID);
    cityModel.data!.forEach((element) {
      citiesMap[element.name.toString()] = element.id.toString();
      print(element.name);
      // print(stateMap[selectedCityByName]);
    });
    emit(UpdateProfileSelectCitySuccess());
  }

  /// select the city and get states form the backend
  Future<void> setSelectedCity(
      {required String cityValue, required String cityID}) async {
    emit(UpdateProfileSelectCityLoading());
    selectedState = null;
    stateMap.clear();
    selectedCity = cityValue;

    stateModel = await authRepo.getStateModel(cityID: cityID);
    stateModel.data!.forEach((element) {
      stateMap[element.name.toString()] = element.id.toString();
      print(stateMap[element.name.toString()]);
      print(stateMap.keys);
    });
    this.cityID.text = cityID;
    emit(UpdateProfileSelectCitySuccess());
  }

  void setSelectedRegion(
      {required String? regionValue, required String? stateID}) {
    emit(UpdateProfileSelectStateLoading());
    selectedState = null;
    selectedState = regionValue;
    this.stateID.text = stateID ?? '';
    emit(UpdateProfileSelectStateSuccess());
  }
}
