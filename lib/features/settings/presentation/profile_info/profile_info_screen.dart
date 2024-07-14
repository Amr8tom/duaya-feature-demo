import 'dart:io';
import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/common/widgets/custom_popup_menu/custom_popup_menu.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/formatters/formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class ProfileInfoScreen extends StatefulWidget {
  const ProfileInfoScreen({super.key});

  @override
  State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  String selectedCountryCode = '+20';
  String currentCountry = "Loading...";
  String currentCity = "Loading...";
  TextEditingController phoneController = TextEditingController();

  /// Select
  List<String> works = [
    S.current.pharmacy,
    S.current.clinic,
    S.current.hospital,
    S.current.lab
  ];
  String? selectWork = S.current.pharmacy;
  XFile? _selectedImage;

  @override
  Widget build(BuildContext context) {
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
                          backgroundImage: const AssetImage(AssetRes.appLogo),
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

              /// Email
              TextFormField(
                expands: false,
                decoration: InputDecoration(
                  // border: InputBorder(borderSide: BorderSide(width: 3)),
                  prefixIcon: const Icon(Iconsax.direct),
                  hintText: S.current.eMail,
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
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: S.current.phoneNumber,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: ColorRes.grey2),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: const Icon(Iconsax.call),
                  prefixIcon: CustomPopupMenu(
                      textWidget: Text(currentCountry == 'Egypt'
                          ? selectedCountryCode.toString()
                          : currentCountry == 'Saudi Arabia' ||
                                  currentCountry == 'Saudi'
                              ? '+966'
                              : selectedCountryCode.toString()),
                      onSelected: (String value) =>
                          setState(() => selectedCountryCode = value)),
                ),
                validator: (value) =>
                    DFormatter.formatPhoneNumber(value, selectedCountryCode),
              ),
              SizedBox(height: AppSizes.spaceBtwInputFields),

              // /// Location (City)
              // TextFormField(
              //   expands: false,
              //   readOnly: true,
              //   decoration: InputDecoration(
              //     hintText: currentCity,
              //     prefixIcon: const Icon(Iconsax.location),
              //   ),
              //   validator: (value) => DFormatter.formatLocation(currentCountry),
              // ),
              // SizedBox(height: AppSizes.spaceBtwInputFields),

              /// Select
              // SizedBox(
              //   width: double.infinity,
              //   child: DropdownButtonFormField<String>(
              //     decoration: InputDecoration(
              //       enabledBorder: const OutlineInputBorder().copyWith(
              //         borderRadius: BorderRadius.circular(14.r),
              //         borderSide: BorderSide(width: 1.w, color: Colors.grey),
              //       ),
              //       focusedBorder: const OutlineInputBorder().copyWith(
              //         borderRadius: BorderRadius.circular(14.r),
              //         borderSide: BorderSide(width: 1.w, color: Colors.grey),
              //       ),
              //       border: const OutlineInputBorder().copyWith(
              //         borderRadius: BorderRadius.circular(14.r),
              //         borderSide: BorderSide(width: 1.w, color: Colors.grey),
              //       ),
              //     ),
              //     value: selectWork,
              //     items: works
              //         .map((item) => DropdownMenuItem(
              //             value: item,
              //             child: Text(item,
              //                 style: const TextStyle().copyWith(
              //                     fontSize: 14.sp, color: Colors.black))))
              //         .toList(),
              //     onChanged: (item) => setState(() => selectWork = item),
              //   ),
              // ),
              // SizedBox(height: AppSizes.spaceBtwInputFields),

              /// Fields
              // TextFormField(
              //   expands: false,
              //   decoration: InputDecoration(
              //     labelText: selectWork == S.current.pharmacy
              //         ? S.current.pharmacyName
              //         : selectWork == S.current.clinic
              //             ? S.current.clinicName
              //             : selectWork == S.current.hospital
              //                 ? S.current.hospitalName
              //                 : S.current.labName,
              //     prefixIcon: const Icon(Iconsax.user_edit),
              //   ),
              // ),
              // SizedBox(height: AppSizes.spaceBtwInputFields),

              selectWork == S.current.pharmacy
                  ? InkWell(
                      onTap: _openImageGallery,
                      child: Container(
                        width: double.infinity,
                        height: 200.h,
                        decoration: BoxDecoration(
                          // ,
                          border: Border.all(
                              color: ColorRes.greenBlue, width: 3.sp),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(AssetRes.uploadImage2),
                                    Text(
                                      S.current.uploadImageCommercial,
                                      style: const TextStyle().copyWith(
                                          fontSize: 12.8.sp,
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                      ),
                    )
                  : Container(),
              SizedBox(height: AppSizes.spaceBtwSections),

              /// Update Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
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
