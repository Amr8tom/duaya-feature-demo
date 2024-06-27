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
import 'package:flutter/widgets.dart';
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
  // String? _selectedCountry;
  // String? _selectedCity;
  // String? _selectedRegion;
  //
  // XFile? _selectedImage;

  @override
  Widget build(BuildContext context) {
    AuthControllerCubit authController = context.read<AuthControllerCubit>();
    return BlocConsumer<AuthControllerCubit, AuthControllerState>(
      listener: (context, state) {
        // TODO: implement listener,
      },
      builder: (context, state) {
        /// state Meanu drop down widget
        Widget getStates({required BuildContext context}) {
          return Column(
            children: [
              Text(
                S.current.selectRegion,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              DropdownButtonFormField<String>(
                value: authController.selectedRegion,
                items: authController.stateMap.keys.map((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    authController.selectedRegion = value;
                  });
                  authController.setSelectedRegion(
                    regionValue: value!,
                    stateID: authController.stateMap![value].toString().trim(),
                  );
                },
              ),
            ],
          );
        }

        return Column(
          children: [
            /// name
            TextWithTextField(
              isError: authController.errorname,
              controller: authController.name,
              title: S.current.userName,
            ),

            /// email
            TextWithTextField(
              isError: authController.erroremail,
              controller: authController.email,
              title: S.current.eMail,
            ),

            /// phone
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
                        : ColorRes.black,
                    width: 1,
                  ),
                ),
                labelText: S.current.phoneNumber,
                suffixIcon: const Icon(Iconsax.call),
                prefixIcon: CustomPopupMenu(
                  textWidget: Text(
                    style: Theme.of(context).textTheme.headlineMedium,
                    authController.currentCountry == S.current.Egypt
                        ? selectedCountryCode.toString()
                        : authController.currentCountry ==
                                    S.current.saudiArabia ||
                                authController.currentCountry == 'Saudi'
                            ? '+966'
                            : selectedCountryCode.toString(),
                  ),
                  onSelected: (String value) =>
                      setState(() => selectedCountryCode = value),
                ),
              ),
            ),

            /// password
            TextWithTextField(
              isError: authController.errorpassword,
              title: S.current.password,
              controller: authController.password,
            ),

            ///confirm password
            TextWithTextField(
              isError: authController.errorconfirmPassword,
              title: S.current.confirmPassword,
              controller: authController.confirmPassword,
            ),
            // hintIcon: (authController.currentCountry == "Egypt")
            //     ? Image.asset(AssetRes.egyptFlag)
            //     : Image.asset(AssetRes.saudiFlag),
            /// country
            Text(
              S.current.selectCountry,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            DropdownButtonFormField<String>(
              value: authController.selectedCountry,
              items: authController.countriesMap.keys.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (value) async {
                setState(() {
                  // Reset cities and region when the country changes
                  authController.setValues(
                      value: value,
                      countryID: authController.countriesMap![value]
                          .toString()
                          .trim());
                });
                authController.fetchCities(
                    countryID: authController
                        .countriesMap[authController.selectedCountry!]!);
              },
            ),

            /// city
            Text(
              S.current.selectCity,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            DropdownButtonFormField<String>(
              value: authController.selectedCity2,
              items: authController.citiesMap.keys.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  authController.selectedCity2 = null;
                  authController.selectedCity2 = value;
                  authController.selectedRegion =
                      null; // Reset region when city changes
                  authController.setSelectedCity(
                    cityValue: value!,
                    cityID: authController.citiesMap![value].toString().trim(),
                  );
                });
              },
            ),

            /// select state
            authController.selectedCity == null
                ? SizedBox()
                : getStates(context: context),
            Text(S.current.worktype,
                style: Theme.of(context).textTheme.headlineMedium),
            DropdownButtonFormField<String>(
              value: authController.workType.text.isNotEmpty
                  ? authController.workType.text
                  : null,
              items: authController.workTypeList.map((item) {
                int index = authController.workTypeList.indexOf(item);
                return DropdownMenuItem<String>(
                  value: authController.realWorkTypeList[index],
                  child: Text(item),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  authController.workType.text = value.toString();
                  authController.ChangeisChoiceWork(value: true);
                });
              },
            ),
            authController.isChoiceWork
                ? TextWithTextField(
                    title:
                        "${S.current.addWorkName} ${authController.workTypeList[authController.realWorkTypeList.indexOf(authController.workType.text)]}",
                    controller: authController.workName,
                    isError: authController.errorworkName,
                  )
                : SizedBox(),
            authController.isChoiceWork
                ? authController.workType.text ==
                        authController.realWorkTypeList[0]
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          S.current.msgImage,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "${S.current.addPhotoOf} ${authController.workTypeList[authController.realWorkTypeList.indexOf(authController.workType.text)]}",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      )
                : SizedBox(),
            authController.isChoiceWork
                ? InkWell(
                    onTap: () {
                      authController.openImageGallery(context: context);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 200.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: authController.selectedImage2 != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(14.r),
                              child: Image.file(
                                File(authController.selectedImage2!.path),
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
                                ],
                              ),
                            ),
                    ),
                  )
                : SizedBox(),
            SizedBox(height: AppSizes.spaceBtwInputFields),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, DRoutesName.webViewRoute,
                    arguments: URL.privacyPolicy);
              },
              child: DTermsAndConditionCheckbox(),
            ),
            SizedBox(height: AppSizes.spaceBtwSections),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  authController.onClickRegistration(context: context);
                },
                child: Text(
                  S.current.createAccount,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
