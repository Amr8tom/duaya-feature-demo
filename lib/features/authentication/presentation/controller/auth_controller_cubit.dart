import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:duaya_app/features/authentication/data/model/loginModel.dart';
import 'package:duaya_app/features/authentication/data/model/registerModel.dart';
import 'package:duaya_app/utils/local_storage/cach_keys.dart';
import 'package:duaya_app/utils/local_storage/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:pinput/pinput.dart';
import 'package:pinput/pinput.dart';
import 'package:pinput/pinput.dart';
import 'package:pinput/pinput.dart';
import 'package:pinput/pinput.dart';
import 'package:pinput/pinput.dart';
import 'package:pinput/pinput.dart';
import 'package:pinput/pinput.dart';
import 'package:pinput/pinput.dart';
import 'package:pinput/pinput.dart';

import '../../../../generated/l10n.dart';
import '../../../../routing/routes_name.dart';
import '../../data/model/citiesModel.dart';
import '../../data/repositories/loginRepo.dart';
import '../../data/repositories/registerRepo.dart';

part 'auth_controller_state.dart';

class AuthControllerCubit extends Cubit<AuthControllerState> {
  AuthControllerCubit() : super(AuthControllerInitial());
  bool isPasswordVisible = false;
  LoginModel userModel = LoginModel();
  RegisterModel registerrModel = RegisterModel();
  CitiesModel citiesModel = CitiesModel();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController region = TextEditingController();
  TextEditingController workType = TextEditingController();
  TextEditingController workName = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController image = TextEditingController();
  TextEditingController location = TextEditingController();
  bool errorname = false;
  bool errorphone = false;
  bool errorworkType = false;
  bool errorworkName = false;
  bool errorcity = false;
  bool erroremail = false;
  bool errorpassword = false;
  bool errorconfirmPassword = false;
  bool errorimage = false;
  bool errorlocation = false;
  List<String> workTypeList = [
    S.current.pharmacy,
    S.current.lab,
    S.current.clinic,
    S.current.hospital
  ];

  List<String> realWorkTypeList = [
    'pharmacy',
    'lab',
    'clinic',
    'hospital',
  ];
  Map<String, String> citiesMap = {};
  Map<String, List<String>?> regionsMap = {};
  String? selectWork = S.current.pharmacy;
  String selectedCity = "";
  String? selectedCityByName = 'الاسكندرية';
  String selectedRegion = "";
  String currentCountry = S.current.loading;
  String currentCity = S.current.loading;
  void showPassword() {
    isPasswordVisible = !isPasswordVisible;
    emit(AuthControllerTogglePassword());
  }

  Future fetchLoadingData(
      {required String password,
      required String email,
      required BuildContext context}) async {
    emit(AuthControllerloading());
    loginRepositoryImpl repo = loginRepositoryImpl();
    userModel = await repo
        .getLoginModel(loginBody: {"email": email, "password": password});
    await PrefService.putString(
        key: CacheKeys.token, value: userModel.accessToken!);
    PrefService.putString(key: CacheKeys.email, value: email);
    PrefService.putString(key: CacheKeys.password, value: password);
    context.pushNamed(DRoutesName.navigationMenuRoute);
    emit(AuthControllerloadingSuccess());
  }

  Future<void> fetchLocationsData() async {
    await _getCurrentLocation();
    await _getCurrentCity();
    regionsMap.clear();
    citiesMap.clear();
    rigsterRepositoryImpl repo = rigsterRepositoryImpl();
    citiesModel = await repo.getCitiesModel();
    citiesModel.data!.forEach((element) {
      citiesMap[element.name.toString()] = element.id.toString();
      regionsMap[element.name.toString()] = element.regions;
      print(regionsMap[selectedCityByName]);
    });
  }

  Future<void> fetchRegisterData(
      {required String name,
      required String emailOrPhone,
      required String password,
      required String passowrdConfirmation,
      required String registerBy,
      required String customerType,
      required String jobName,
      required String phone,
      required String license_img,
      required String filename,
      required String region,
      required String brandId}) async {
    rigsterRepositoryImpl repo = rigsterRepositoryImpl();
    RegisterModel registerrModel = await repo.getRisgterModel(rigsterBody: {
      "name": name,
      "email_or_phone": emailOrPhone,
      "password": password,
      "password_confirmation": passowrdConfirmation,
      "register_by": "email",
      "customer_type": customerType,
      "job_name": jobName,
      "phone": phone,
      "license_img": license_img,
      "filename": filename,
      "region": region,
      "brand_id": brandId
    });
  }

  onClickRegistration({required BuildContext context}) {
    errorname = false;
    errorphone = false;
    errorworkType = false;
    errorworkName = false;
    errorcity = false;
    erroremail = false;
    errorpassword = false;
    errorconfirmPassword = false;
    errorimage = false;
    errorlocation = false;
    if (name.text.trim().isEmpty) {
      errorname = true;
    }
    if (phone.text.trim().isEmpty) {
      errorphone = true;
    }
    if (workName.text.trim().isEmpty) {
      errorworkName = true;
    }
    if (workType.text.trim().isEmpty) {
      errorworkType = true;
    }
    if (city.text.trim().isEmpty) {
      errorcity = true;
    }
    if (email.text.trim().isEmpty) {
      erroremail = true;
    }
    if (password.text.trim().isEmpty) {
      errorpassword = true;
    }
    if (confirmPassword.text.trim().isEmpty) {
      errorconfirmPassword = true;
    }
    if (image.text.trim().isEmpty) {
      errorimage = true;
    }
    if (location.text.trim().isEmpty) {
      errorlocation = true;
    }
    if (errorname ||
        errorphone ||
        errorworkType ||
        errorworkName ||
        errorcity ||
        erroremail ||
        errorpassword ||
        errorconfirmPassword ||
        errorimage ||
        errorlocation) {
      emit(AuthControllerError());
      showWarningDialoag(
          context: context, title: "", body: S.current.pleaseEndterValue);
    }
    emit(AuthControllerSuccess());
  }

  Future<void> showWarningDialoag(
      {required BuildContext context, String? title, String? body}) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? ""),
          content: Text(body ?? ""),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(S.current.done),
            ),
          ],
        );
      },
    );
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
      emit(AuthControllerInitial());
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
    emit(AuthControllerInitial());
  }

  void setSelectedCity({required String cityValue, required String cityID}) {
    selectedCityByName = cityValue;
    selectedCity = cityID;

    emit(AuthControllerToggleCity());
  }

  void setSelectedRegion({required String regionValue}) {
    selectedRegion = regionValue;
    emit(AuthControllerToggleRigon());
  }

  void clearData() {
    citiesMap.clear();
    regionsMap.clear();
    email.clear();
    name.clear();
    phone.clear();
    region.clear();
    workType.clear();
    workName.clear();
    city.clear();
    email.clear();
    password.clear();
    confirmPassword.clear();
    image.clear();
    location.clear();
  }
}
