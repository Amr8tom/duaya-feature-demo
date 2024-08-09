import 'dart:io';
import 'package:duaya_app/common/custom_ui.dart';
import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/settings/presentation/controller/update_profile_cubit.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../authentication/presentation/controller/auth_controller_cubit.dart';

class ProfileInfoScreen extends StatelessWidget {
  ProfileInfoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final updateProfileController = context.read<UpdateProfileCubit>();
    final authController = context.read<AuthControllerCubit>();

    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: DAppBar(
            title: Text(
              S.current.profileInfo,
            ),
            centerTitle: true,
            showBackArrow: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(AppSizes.padding),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 50.r,
                            backgroundColor: ColorRes.grey,
                            child: CircleAvatar(
                              radius: 48.r,
                              backgroundColor: ColorRes.greenBlueLight,
                              backgroundImage:
                                  updateProfileController.selectedImage == null
                                      ? AssetImage(AssetRes.appLogo)
                                          as ImageProvider
                                      : FileImage(File(updateProfileController
                                          .selectedImage!.path)),
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 20.r,
                                backgroundColor: ColorRes.grey2,
                                child: IconButton(
                                  icon: Icon(Icons.camera_alt,
                                      color: ColorRes.white, size: 19.sp),
                                  onPressed: () {},
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizes.defaultSpace),

                  /// Username
                  TextFormField(
                    expands: false,
                    controller: updateProfileController.name,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.user_edit),
                      hintText: S.current.userName,
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: ColorRes.grey2),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                  SizedBox(height: AppSizes.spaceBtwInputFields),

                  /// job name
                  TextFormField(
                    expands: false,
                    controller: updateProfileController.job,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.hospital),
                      hintText: S.current.workName,
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: ColorRes.grey2),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                  SizedBox(height: AppSizes.spaceBtwInputFields),

                  /// Phone Number
                  TextFormField(
                    expands: false,
                    controller: updateProfileController.phone,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone),
                      hintText: S.current.phoneNumber,
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: ColorRes.grey2),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                  SizedBox(height: AppSizes.spaceBtwInputFields),

                  /// password
                  TextFormField(
                    expands: false,
                    controller: updateProfileController.password,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      hintText: S.current.password,
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: ColorRes.grey2),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                  SizedBox(height: AppSizes.spaceBtwInputFields),

                  ///  get country
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      hintText: S.current.selectCountry,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            BorderSide(color: ColorRes.greenBlue, width: 2.0),
                      ),
                    ),
                    value: updateProfileController.selectedCountry,
                    items:
                        updateProfileController.countriesMap.keys.map((item) {
                      print(item);
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (value) async {
                      // Reset cities and region when the country changes
                      updateProfileController.setValues(
                          value: value,
                          countryID: updateProfileController
                              .countriesMap![value]
                              .toString()
                              .trim());
                      updateProfileController.fetchCities(
                          countryID: updateProfileController.countriesMap[
                              updateProfileController.selectedCountry!]!);
                    },
                  ),
                  SizedBox(height: AppSizes.spaceBtwSections),

                  ///  get city
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      hintText: S.current.selectCity,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            BorderSide(color: ColorRes.greenBlue, width: 2.0),
                      ),
                    ),
                    value: updateProfileController.selectedCity,
                    items: updateProfileController.citiesMap.keys.map((item) {
                      print(item);
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (value) async {
                      updateProfileController.selectedCity = null;
                      updateProfileController.cityID.text =
                          updateProfileController.citiesMap![value]!;
                      updateProfileController.setSelectedCity(
                        cityValue: value!,
                        cityID: updateProfileController.citiesMap![value]
                            .toString()
                            .trim(),
                      );
                    },
                  ),
                  SizedBox(height: AppSizes.spaceBtwSections),

                  ///  get state
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
                    value: updateProfileController.selectedState,
                    items: updateProfileController.stateMap.keys.map((item) {
                      print(item);
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (value) async {
                      // updateProfileController.selectedCity = null;
                      // Reset cities and region when the country changes
                      // updateProfileController.setValues(
                      updateProfileController.setSelectedRegion(
                        regionValue: value!,
                        stateID: updateProfileController.stateMap![value]
                            .toString()
                            .trim(),
                      );
                    },
                  ),
                  SizedBox(height: AppSizes.spaceBtwSections),

                  /// pick lisence image
                  InkWell(
                    onTap: () {
                      updateProfileController.getImage();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 200.h,
                      decoration: BoxDecoration(
                        // ,
                        border:
                            Border.all(color: ColorRes.greenBlue, width: 3.sp),
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: updateProfileController.selectedImage != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(14.r),
                              child: Image.file(
                                File(updateProfileController
                                    .selectedImage!.path),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            )
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(AssetRes.uploadImage2),
                                  Text(
                                    S.current.uploadImageCommercial,
                                    style: const TextStyle().copyWith(
                                        fontSize: 12.8.sp, color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                    ),
                  ),
                  SizedBox(height: AppSizes.spaceBtwSections),

                  /// Update Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () async {
                          CustomUI.loader(context: context);
                          // const Loader();
                          await updateProfileController.fetchUpdataProfile(
                              context: context);
                          Navigator.pop(context);
                        },
                        child: Text(
                          S.current.saveChanges,
                          style: TextStyle(color: ColorRes.white),
                        )),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
