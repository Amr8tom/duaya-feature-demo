import 'dart:io';
import 'package:duaya_app/common/widgets/custom_popup_menu/custom_popup_menu.dart';
import 'package:duaya_app/features/authentication/presentation/signup/widgets/TextFormWidget.dart';
import 'package:duaya_app/features/authentication/presentation/signup/widgets/terms_conditions_checkbox.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/formatters/formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:lottie/lottie.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../../utils/constants/api_constants.dart';
import '../../../../../utils/constants/colors.dart';
import '../../controller/auth_controller_cubit.dart';

class DSignupForm extends StatefulWidget {
  const DSignupForm({super.key});

  @override
  State<DSignupForm> createState() => _DSignupFormState();
}

class _DSignupFormState extends State<DSignupForm> {
  String selectedCountryCode = '+20';

  /// Select

  XFile? _selectedImage;
  @override
  Widget build(BuildContext context) {
    AuthControllerCubit authController = context.read<AuthControllerCubit>();

    return BlocConsumer<AuthControllerCubit, AuthControllerState>(
      listener: (context, state) {
        // TODO: implement listener,
      },
      builder: (context, state) {
        return Column(
          children: [
            ////////////////////////////// Username  /////////////////
            TextWithTextField(
              isError: authController.errorname,
              controller: authController.name,
              title: S.current.userName,
            ),
            TextWithTextField(
              isError: authController.erroremail,
              controller: authController.email,
              title: S.current.eMail,
            ),

            //////////////////////////// Phone Number///////////////////////
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  authController.showWarningDialoag(context: context);
                }
                DFormatter.formatPhoneNumber(value, selectedCountryCode);
              },
              controller: authController.phone,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: authController.errorphone
                          ? ColorRes.error2
                          : ColorRes.transparent,
                      width: 1.5),
                ),
                labelText: S.current.phoneNumber,
                suffixIcon: const Icon(Iconsax.call),
                prefixIcon: CustomPopupMenu(
                    textWidget: Text(
                        authController.currentCountry == S.current.Egypt
                            ? selectedCountryCode.toString()
                            : authController.currentCountry ==
                                        S.current.saudiArabia ||
                                    authController.currentCountry == 'Saudi'
                                ? '+966'
                                : selectedCountryCode.toString()),
                    onSelected: (String value) =>
                        setState(() => selectedCountryCode = value)),
              ),
              // validator: (value) =>,
            ),

            ///////////////////////////// Password   ///////////////////////
            TextWithTextField(
                isError: authController.errorpassword,
                title: S.current.password,
                controller: authController.password),
            TextWithTextField(
              isError: authController.errorconfirmPassword,
              title: S.current.confirmPassword,
              controller: authController.confirmPassword,
            ),

            ///////////////////////////////// Location (Country)  ////////////////////
            TextWithTextField(
              title: " ",
              controller: authController.location,
              toggle: true,
              hintText: authController.currentCountry,
            ),

            //////////////////////////      City    ///////////////////////////////////////
            Text(
              S.current.selectCity,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Playfair Display'),
            ),
            DropdownButtonFormField<String>(
              items: authController.citiesMap.keys.map((item) {
                return DropdownMenuItem<String>(
                  value: "$item",
                  child: Text("${item}"),
                );
              }).toList(),
              onChanged: (value) {
                authController.setSelectedCity(
                  cityValue: value!,
                  cityID: authController.citiesMap![value].toString().trim(),
                );
              },
            ),
            ///////////////////////////////   region    ///////////////////////////////////////
            /////// you will do it as a map in laravel city is the key and the value is list of regions
            //// here you will integrate the api and show the regions each city
            ///// thnks my god for the idea  <3   eng/amr alaa ali   010115770337

            authController.selectedCity == ""
                ? SizedBox()
                : Column(
                    children: [
                      Text(
                        S.current.selectRegion,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Poppins'),
                      ),
                      DropdownButtonFormField<String>(
                        items: authController
                            .regionsMap[authController.selectedCityByName]!
                            .map((item) =>
                                item.trim()) // Trim each item if necessary
                            .toSet() // Convert to a set to remove duplicates
                            .map((uniqueItem) {
                          return DropdownMenuItem<String>(
                            value: "$uniqueItem",
                            child: Text("$uniqueItem"),
                          );
                        }).toList(),
                        onChanged: (value) {
                          authController.setSelectedRegion(regionValue: value!);
                          // Handle onChanged logic here
                        },
                      ),
                    ],
                  ),

            ////////////////////   business Type   /////////////////
            Text(S.current.worktype,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Poppins')),
            DropdownButtonFormField<String>(
              items: authController.workTypeList.map((item) {
                int index = authController.workTypeList.indexOf(item);
                return DropdownMenuItem<String>(
                  value: "${authController.realWorkTypeList[index]}",
                  child: Text("${item}"),
                );
              }).toList(),
              onChanged: (value) {
                authController.workType.text = value.toString();
              },
            ),

            TextWithTextField(
                title: S.current.workName,
                controller: authController.workName,
                isError: authController.errorworkName),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                S.current.msgImage,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Poppins'),
              ),
            ),
            authController.selectWork == S.current.pharmacy
                ? InkWell(
                    onTap: _openImageGallery,
                    child: Container(
                      width: double.infinity,
                      height: 200.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: _selectedImage != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(14.r),
                              child: Image.file(
                                File(_selectedImage!.path),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            )
                          : Center(
                              child: Column(
                                children: [
                                  Lottie.asset(AssetRes.uploadImage,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              5.2),
                                  Text(
                                    S.current.uploadImageCommercial,
                                    style: const TextStyle().copyWith(
                                        fontSize: 12.8.sp, color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                    ),
                  )
                : Container(),
            SizedBox(height: AppSizes.spaceBtwInputFields),
            ////////////////////// Terms&Conditions Checkbox////////////
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, DRoutesName.webViewRoute,
                      arguments: URL.privacyPolicy);
                },
                child: DTermsAndConditionCheckbox()),
            SizedBox(height: AppSizes.spaceBtwSections),
            ////////////////////// submmit data to the API   //////////////////////
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async {
                    authController.onClickRegistration(context: context);
                    await authController.fetchRegisterData(
                      region: authController.selectedRegion,
                      name: authController.name.text.trim(),
                      phone: authController.phone.text.trim(),
                      password: authController.password.text.trim(),
                      passowrdConfirmation:
                          authController.confirmPassword.text.trim(),
                      emailOrPhone: authController.email.text.trim(),
                      jobName: authController.workName.text.trim(),
                      customerType: authController.workType.text.trim(),
                      registerBy: "email",
                      filename:
                          "authController.name.text", /////////something wrong here
                      license_img:
                          '4324fghjkl324ret', /////////something wrong here
                      brandId: authController.selectedCity!,
                    );
                  },
                  // onPressed: () => Get.to(() => const VerifyEmailScreen()),
                  child: Text(S.current.createAccount)),
            ),
          ],
        );
      },
    );
  }

  Future<void> _openImageGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    } else {
      // User canceled the image picking
      print('No image selected');
    }
  }
}
