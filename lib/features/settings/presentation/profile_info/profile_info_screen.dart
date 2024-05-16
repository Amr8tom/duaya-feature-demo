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
  List<String> works = [S.current.pharmacy, S.current.clinic, S.current.hospital, S.current.lab];
  String? selectWork = S.current.pharmacy;
  XFile? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        title: Text(S.current.profileInfo,style: Theme.of(context).textTheme.titleLarge),
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
                          backgroundImage: const AssetImage(AssetRes.profileLogo),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 20.r,
                            backgroundColor: ColorRes.grey2,
                            child: IconButton(
                              icon: Icon(Icons.camera_alt, color: ColorRes.white, size: 19.sp),
                              onPressed: () {},
                            ),
                          )
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: AppSizes.defaultSpace),
              /// Username
              TextFormField(
                expands: false,
                decoration: InputDecoration(
                  labelText: S.current.userName,
                  prefixIcon: const Icon(Iconsax.user_edit),
                  hintText: 'Amr alaa ali',
                  hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: ColorRes.grey2),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              SizedBox(height: AppSizes.spaceBtwInputFields),

              /// Email
              TextFormField(
                expands: false,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  prefixIcon: const Icon(Iconsax.direct),
                  hintText: 'amr8tom@gmail.com',
                  hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: ColorRes.grey2),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              SizedBox(height: AppSizes.spaceBtwInputFields),

              /// Phone Number
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: S.current.phoneNumber,
                  hintText: '01011577033',
                  hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: ColorRes.grey2),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: const Icon(Iconsax.call),
                  prefixIcon: CustomPopupMenu(textWidget: Text(currentCountry == 'Egypt' ? selectedCountryCode.toString() : currentCountry == 'Saudi Arabia' || currentCountry == 'Saudi' ? '+966' : selectedCountryCode.toString()), onSelected: (String value) => setState(() => selectedCountryCode = value)),
                ),
                validator: (value) => DFormatter.formatPhoneNumber(value, selectedCountryCode),
              ),
              SizedBox(height: AppSizes.spaceBtwInputFields),

              /// Location (City)
              TextFormField(
                expands: false,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: currentCity,
                  prefixIcon: const Icon(Iconsax.location),
                ),
                validator: (value) => DFormatter.formatLocation(currentCountry),
              ),
              SizedBox(height: AppSizes.spaceBtwInputFields),

              /// Select
              SizedBox(
                width: double.infinity,
                child:  DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder().copyWith(
                      borderRadius: BorderRadius.circular(14.r),
                      borderSide: BorderSide(width: 1.w, color: Colors.grey),
                    ),
                    focusedBorder: const OutlineInputBorder().copyWith(
                      borderRadius: BorderRadius.circular(14.r),
                      borderSide: BorderSide(width: 1.w, color: Colors.grey),
                    ),
                    border: const OutlineInputBorder().copyWith(
                      borderRadius: BorderRadius.circular(14.r),
                      borderSide: BorderSide(width: 1.w, color: Colors.grey),
                    ),
                  ),
                  value: selectWork,
                  items: works.map((item) => DropdownMenuItem(value: item, child: Text(item, style: const TextStyle().copyWith(fontSize: 14.sp, color: Colors.black)))).toList(),
                  onChanged: (item) => setState(() => selectWork = item),
                ),
              ),
              SizedBox(height: AppSizes.spaceBtwInputFields),

              /// Fields
              TextFormField(
                expands: false,
                decoration: InputDecoration(
                  labelText: selectWork == S.current.pharmacy ? S.current.pharmacyName : selectWork == S.current.clinic ? S.current.clinicName : selectWork == S.current.hospital ? S.current.hospitalName : S.current.labName,
                  prefixIcon: const Icon(Iconsax.user_edit),
                ),
              ),
              SizedBox(height: AppSizes.spaceBtwInputFields),

              selectWork == S.current.pharmacy ? InkWell(
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
                        Lottie.asset(AssetRes.uploadImage, height: MediaQuery.of(context).size.height / 5.2),
                        Text(S.current.uploadImageCommercial, style: const TextStyle().copyWith(fontSize: 12.8.sp, color: Colors.black),)
                      ],
                    ),
                  ),
                ),
              ) : Container(),
              SizedBox(height: AppSizes.spaceBtwSections),

              /// Update Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    child:  Text(S.current.saveChanges)),
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