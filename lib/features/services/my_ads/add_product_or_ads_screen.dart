import 'dart:io';
import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/common/widgets/custom_popup_menu/custom_popup_menu.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/formatters/formatter.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class AddProductOrAdsScreen extends StatefulWidget {
  const AddProductOrAdsScreen({super.key});

  @override
  State<AddProductOrAdsScreen> createState() => _AddProductOrAdsScreenState();
}

class _AddProductOrAdsScreenState extends State<AddProductOrAdsScreen> {
  XFile? _selectedImageFromCamera;
  String currentCountry = "Loading...";
  String selectedCountryCode = '+20';
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        title: Text(
          S.current.addProduct,
        ),
        centerTitle: true,
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.spaceBtwItems),
          child: Column(
            children: [
              TextFormField(
                expands: false,
                decoration: InputDecoration(
                  labelText: S.current.productName,
                  prefixIcon: Icon(Iconsax.user_edit),
                ),
              ),
              SizedBox(height: AppSizes.spaceBtwInputFields),
              InkWell(
                onTap: _openCamera,
                child: Container(
                  width: double.infinity,
                  height: 200.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: _selectedImageFromCamera != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(14.r),
                          child: Image.file(
                            File(_selectedImageFromCamera!.path),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        )
                      : Center(
                          child: Column(
                            children: [
                              Lottie.asset(AssetRes.emptyProduct2,
                                  height:
                                      MediaQuery.of(context).size.height / 5.2),
                              Text(
                                S.current.productImage,
                                style: const TextStyle().copyWith(
                                    fontSize: 12.8.sp, color: Colors.black),
                              )
                            ],
                          ),
                        ),
                ),
              ),
              SizedBox(height: AppSizes.spaceBtwInputFields),

              TextFormField(
                expands: false,
                decoration: InputDecoration(
                  labelText: S.current.productPrice,
                  prefixIcon: Icon(Iconsax.money),
                ),
              ),
              SizedBox(height: AppSizes.spaceBtwInputFields),

              // TextFormField(
              //   expands: false,
              //   decoration: const InputDecoration(
              //     labelText: '',
              //     prefixIcon: Icon(Icons.local_offer_outlined),
              //   ),
              // ),
              // SizedBox(height: AppSizes.spaceBtwInputFields),

              /// Phone Number
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: S.current.phoneNumber,
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
              SizedBox(height: AppSizes.spaceBtwInputFields * 10),
              InkWell(
                onTap: () {
                  context.pop();
                },
                child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Center(child: Text(S.current.send))),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _selectedImageFromCamera = image;
      });
    } else {
      print('No image selected');
    }
  }
}
