import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:duaya_app/common/common_snak_bar_widget.dart';
import 'package:duaya_app/features/authentication/data/model/CityModel.dart';
import 'package:duaya_app/features/authentication/data/model/StateID.dart';
import 'package:duaya_app/features/authentication/data/model/countryModel.dart';
import 'package:duaya_app/features/authentication/data/model/loginModel.dart';
import 'package:duaya_app/features/authentication/data/model/registerModel.dart';
import 'package:duaya_app/utils/local_storage/cach_keys.dart';
import 'package:duaya_app/utils/local_storage/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import '../../../../common/custom_ui.dart';
import '../../../../generated/l10n.dart';
import '../../../../routing/routes_name.dart';
import '../../data/repositories/loginRepo.dart';
import '../../data/repositories/registerRepo.dart';
part 'auth_controller_state.dart';

class AuthControllerCubit extends Cubit<AuthControllerState> {
  AuthControllerCubit() : super(AuthControllerInitial());
  bool isPasswordVisible = false;
  bool isChoiceWork = false;
  bool isAgree = false;
  LoginModel userModel = LoginModel();
  RegisterModel registerrModel = RegisterModel();
  CountryModel countryModel = CountryModel();
  CityModel cityModel = CityModel();
  StateIdModel stateModel = StateIdModel();
  String? selectedCountry;
  String? selectedCountryID;
  String? selectedCity2;
  String? selectedRegion2;
  XFile? selectedImage2;
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController region = TextEditingController();
  TextEditingController workType = TextEditingController();
  TextEditingController workName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController image = TextEditingController();
  rigsterRepositoryImpl repo = rigsterRepositoryImpl();
  XFile? selectedImage;
  FormData? formData; // Variable to hold FormData
  bool errorname = false;
  bool errorphone = false;
  bool errorworkType = false;
  bool errorCheckBox = false;
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
  Map<String, String> countriesMap = {};
  Map<String, String> citiesMap = {};
  Map<String, String> stateMap = {};
  String? selectWork = S.current.pharmacy;
  String selectedCity = "";
  bool showSates = false;
  String? selectedCityByName = 'الاسكندرية';
  String? selectedRegion = null;
  String? selectedRegionID = null;
  String currentCountry = S.current.loading;
  String currentCity = S.current.loading;
  void showPassword() {
    isPasswordVisible = !isPasswordVisible;
    emit(AuthControllerTogglePassword());
  }

  Future fetchLoginData(
      {required String password,
      required String email,
      required BuildContext context}) async {
    emit(AuthControllerloading());
    loginRepositoryImpl repo = loginRepositoryImpl();
    CustomUI.loader(context: context);
    try {
      userModel = await repo
          .getLoginModel(loginBody: {"email": email, "password": password});
      commonToast(userModel.message.toString());
      await PrefService.putString(
          key: CacheKeys.token, value: userModel.accessToken!);
      PrefService.putString(key: CacheKeys.email, value: email);
      PrefService.putString(key: CacheKeys.password, value: password);
      PrefService.putString(
          key: CacheKeys.cityID, value: userModel.user!.brandId.toString());
      context.pushReplacementNamed(DRoutesName.navigationMenuRoute);
      emit(AuthControllerloadingSuccess());
    } catch (e) {
      Navigator.pop(context);
      commonToast("${S.current.noUserFound} \n ${S.current.tryAgain}");
    }
  }

  Future<void> fetchCountries() async {
    emit(AuthControllerCityLoading());
    countriesMap.clear();
    countryModel = await repo.getCountryModel();
    countryModel.data!.forEach((element) {
      countriesMap[element.name.toString()] = element.id.toString();
    });
    emit(AuthControllerCitySuccess());
  }

  Future<void> fetchCities({required String countryID}) async {
    emit(AuthControllerCityLoading());
    stateMap.clear();
    citiesMap.clear();
    cityModel = await repo.getCityModel(countryID: countryID);
    cityModel.data!.forEach((element) {
      citiesMap[element.name.toString()] = element.id.toString();
      print(stateMap[selectedCityByName]);
    });
    emit(AuthControllerCitySuccess());
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
      required String stateID,
      required String countryID,
      required String cityID}) async {
    rigsterRepositoryImpl repo = rigsterRepositoryImpl();
    // File file = File(selectedImage2!.path);
    // print('File is = ' + file.toString());
    // List<int> fileInByte = file.readAsBytesSync();
    // final base64Image = base64Encode(fileInByte);
    FormData registerForm = FormData.fromMap({
      'license_img': [
        await MultipartFile.fromFile(selectedImage2!.path,
            filename: selectedImage2!.path.split('/').last)
      ],
      "name": name,
      "email_or_phone": emailOrPhone,
      "password": password,
      "password_confirmation": passowrdConfirmation,
      "register_by": "email",
      "customer_type": customerType,
      "job_name": jobName,
      "phone": phone,
      // "license_img": base64Image,
      "filename": filename,
      "region": selectedRegionID,
      "state_id": cityID,
      "city_id": stateID,
      "country_id": countryID,
    });
    registerrModel = await repo.getRisgterModel(rigsterBody: registerForm);
  }

  Future onClickRegistration({required BuildContext context}) async {
    errorname = false;
    errorphone = false;
    errorworkType = false;
    errorworkName = false;
    erroremail = false;
    errorpassword = false;
    errorconfirmPassword = false;
    errorCheckBox = false;
    errorimage = false;
    if (name.text.trim().isEmpty) {
      print("errorname");
      errorname = true;
    }
    if (phone.text.trim().isEmpty) {
      print("errorphone");
      errorphone = true;
    }
    if (workName.text.trim().isEmpty) {
      print("errorworkName");
      errorworkName = true;
    }
    if (workType.text.trim().isEmpty) {
      print("errorworkType");
      errorworkType = true;
    }
    if (email.text.trim().isEmpty) {
      print("erroremail");
      erroremail = true;
    }
    if (password.text.trim().isEmpty) {
      print("errorpassword");
      errorpassword = true;
    }
    if (confirmPassword.text.trim().isEmpty) {
      print("errorconfirmPassword");
      errorconfirmPassword = true;
    }
    if (image.text.trim().isEmpty) {
      print("errorimage");
      errorimage = true;
    }
    if (isAgree == false) {
      print("errorCheckBox");
      errorCheckBox = true;
    }
    if (errorname ||
        errorphone ||
        errorCheckBox ||
        errorworkType ||
        errorworkName ||
        errorcity ||
        erroremail ||
        errorpassword ||
        errorconfirmPassword) {
      emit(AuthControllerError());
      commonToast(S.current.pleaseEndterValue);
    } else {
      CustomUI.loader(context: context);
      await fetchRegisterData(
        stateID: selectedRegionID ?? "",
        name: name.text.trim(),
        phone: phone.text.trim(),
        password: password.text.trim(),
        passowrdConfirmation: confirmPassword.text.trim(),
        emailOrPhone: email.text.trim(),
        jobName: workName.text.trim(),
        customerType: workType.text.trim(),
        registerBy: "email",
        filename: selectedImage2!.path.split('/').last,
        license_img: selectedImage2!.path,
        cityID: selectedCity!,
        countryID: selectedCountryID ?? "64",
      );
      commonToast(registerrModel.message!);
      context.pushReplacementNamed(DRoutesName.loginRoute);
      emit(AuthControllerSuccess());
    }
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

  void ChangeisChoiceWork({required bool value}) {
    isChoiceWork = true;
    emit(AuthControllerToggleRegion());
  }

  /// select the city and get states form the backend
  Future<void> setSelectedCity(
      {required String cityValue, required String cityID}) async {
    emit(AuthControllerCityLoading());
    stateMap.clear();
    selectedCity == "";
    selectedRegion == null;
    selectedCityByName = cityValue;
    stateModel = await repo.getStateModel(cityID: cityID);
    stateModel.data!.forEach((element) {
      stateMap[element.name.toString()] = element.id.toString();
      print(stateMap[element.name.toString()]);
      print(stateMap.keys);
    });
    selectedCity = cityID;
    emit(AuthControllerCitySuccess());
  }

  void setSelectedRegion(
      {required String? regionValue, required String? stateID}) {
    selectedRegion = regionValue;
    selectedRegionID = stateID;
    emit(AuthControllerToggleRigon());
  }

  void clearData() {
    citiesMap.clear();
    stateMap.clear();
    email.clear();
    name.clear();
    phone.clear();
    region.clear();
    workType.clear();
    workName.clear();
    email.clear();
    password.clear();
    confirmPassword.clear();
    image.clear();
  }

  void setValues({value, required String countryID}) async {
    emit(AuthControllerToggleCity());
    selectedCountry = value;
    selectedCountryID = countryID;
    selectedCity2 = null;
    selectedRegion = null;
    emit(AuthControllerSuccess());
  }

  Future<void> openImageGallery({required BuildContext context}) async {
    emit(AuthControllerToggleCity());
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage2 = image;

      emit(AuthControllerToggleCity());
    } else {
      emit(AuthControllerToggleCity());
    }
  }

  void toggleCheckBox() {
    emit(AuthControllerToggleCheckBoxFalse());
    isAgree = !isAgree;
    emit(AuthControllerToggleCheckBoxTrue());
  }
}
