import 'dart:io';
import 'package:duaya_app/common/widgets/custom_popup_menu/custom_popup_menu.dart';
import 'package:duaya_app/features/authentication/presentation/signup/widgets/terms_conditions_checkbox.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/formatters/formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:lottie/lottie.dart';
import '../../../../../utils/constants/colors.dart';
import '../../controller/auth_controller_cubit.dart';
import 'TextFormRegisterationWidget.dart';

class DSignupForm extends StatefulWidget {
  const DSignupForm({super.key});

  @override
  State<DSignupForm> createState() => _DSignupFormState();
}

class _DSignupFormState extends State<DSignupForm> {
  String selectedCountryCode = '+20';

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
              SizedBox(
                height: 15.h,
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  hintText: S.current.selectRegion,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        BorderSide(color: ColorRes.greenBlue, width: 2.0),
                  ),
                ),
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
            TextWithTextFieldForRrgistration(
              isError: authController.errorname,
              controller: authController.name,
              title: S.current.userName,
            ),

            /// email
            TextWithTextFieldForRrgistration(
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
                        : ColorRes.greenBlue,
                    width: 1,
                  ),
                ),
                labelText: S.current.phoneNumber,
                suffixIcon: const Icon(Iconsax.call),
                prefixIcon: CustomPopupMenu(
                  textWidget: Text(
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: ColorRes.greenBlue),
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

            /// size
            SizedBox(
              height: 15.h,
            ),

            /// agentCode
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  authController.showWarningDialoag(context: context);
                }
                DFormatter.formatPhoneNumber(value, selectedCountryCode);
              },
              controller: authController.agentCode,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorRes.greenBlue,
                    width: 1,
                  ),
                ),
                labelText: S.current.agentCode,
                suffixIcon: const Icon(Iconsax.personalcard),
              ),
            ),

            /// password
            TextWithTextFieldForRrgistration(
              isError: authController.errorpassword,
              title: S.current.password,
              controller: authController.password,
            ),

            ///confirm password
            TextWithTextFieldForRrgistration(
              isError: authController.errorconfirmPassword,
              title: S.current.confirmPassword,
              controller: authController.confirmPassword,
            ),
            // hintIcon: (authController.currentCountry == "Egypt")
            //     ? Image.asset(AssetRes.egyptFlag)
            //     : Image.asset(AssetRes.saudiFlag),
            /// country
            SizedBox(
              height: 15.h,
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                hintText: S.current.selectCountry,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: ColorRes.greenBlue, width: 2.0),
                ),
              ),
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
            SizedBox(
              height: 15.h,
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                hintText: S.current.selectCity,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: ColorRes.greenBlue, width: 2.0),
                ),
              ),
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
            SizedBox(
              height: 15.h,
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                hintText: S.current.worktype,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: ColorRes.greenBlue, width: 2.0),
                ),
              ),
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
                ? TextWithTextFieldForRrgistration(
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
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  color: ColorRes.greenBlue,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "${S.current.addPhotoOf} ${authController.workTypeList[authController.realWorkTypeList.indexOf(authController.workType.text)]}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  color: ColorRes.greenBlue,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold),
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
                        border: Border.all(color: ColorRes.greenBlue),
                        borderRadius: BorderRadius.circular(15.r),
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
            DTermsAndConditionCheckbox(),
            SizedBox(height: AppSizes.spaceBtwSections),
            InkWell(
              onTap: () async {
                authController.onClickRegistration(context: context);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: authController.isAgree
                        ? ColorRes.greenBlue
                        : ColorRes.greenBlue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(50.sp)),
                width: 182.sp,
                height: 46.sp,
                child: Center(
                  child: Text(
                    S.current.createAccount,
                    style: TextStyle(
                      color: authController.isAgree
                          ? Colors.white
                          : ColorRes.greenBlue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
