import 'dart:io';

import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/common/widgets/floating_action_button/custom_floating_action_button.dart';
import 'package:duaya_app/features/home/presentation/widgets/custom_container_product/custom_container_product.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import '../../../../generated/l10n.dart';

class ShortComingScreen extends StatefulWidget {
  const ShortComingScreen({super.key});

  @override
  State<ShortComingScreen> createState() => _ShortComingScreenState();
}

class _ShortComingScreenState extends State<ShortComingScreen> {
  XFile? _selectedImage;
  XFile? _selectedImageFromCamera;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        title: Text(S.current.ShortComingScreen),
        centerTitle: true,
        showBackArrow: true,
      ),
      body: Padding(
          padding: EdgeInsets.all(AppSizes.spaceBtwItems),
          child: Column(
            children: [
              InkWell(
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
                                      MediaQuery.of(context).size.height / 5.2),
                              Text(
                                S.current.uploadFileOrExcelSheet,
                                style: const TextStyle().copyWith(
                                    fontSize: 12.8.sp, color: Colors.black),
                              )
                            ],
                          ),
                        ),
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
                              Lottie.asset(AssetRes.uploadImage,
                                  height:
                                      MediaQuery.of(context).size.height / 5.2),
                              Text(
                                S.current.takeCameraPhoto,
                                style: const TextStyle().copyWith(
                                    fontSize: 12.8.sp, color: Colors.black),
                              )
                            ],
                          ),
                        ),
                ),
              ),
              SizedBox(height: AppSizes.spaceBtwInputFields),
            ],
          )),
      // floatingActionButton: const CustomFloatingActionButton(textButton: 'Create Order'),
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
