import 'dart:io';

import 'package:dio/dio.dart';
import 'package:duaya_app/common/common_snak_bar_widget.dart';
import 'package:duaya_app/common/custom_ui.dart';
import 'package:duaya_app/features/services/my_ads/presentation/controller/add_ads_cubit.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../common/widgets/custom_popup_menu/custom_popup_menu.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/formatters/formatter.dart';
import '../../../../../authentication/presentation/controller/auth_controller_cubit.dart';

class CustomAddProductBody extends StatefulWidget {
  const CustomAddProductBody({super.key});

  @override
  State<CustomAddProductBody> createState() => _CustomAddProductBodyState();
}

class _CustomAddProductBodyState extends State<CustomAddProductBody> {
  XFile? _selectedImageFromCamera;
  String currentCountry = "Loading...";
  String selectedCountryCode = '+20';
  TextEditingController productNameController = TextEditingController();
  TextEditingController whatsAppController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController descreptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final addAdsController = context.read<AddAdsCubit>();
    final userController = context.read<AuthControllerCubit>();

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(AppSizes.spaceBtwItems),
        child: Column(
          children: [
            /// product name
            TextFormField(
              controller: productNameController,
              expands: false,
              decoration: InputDecoration(
                labelText: S.current.productName,
                prefixIcon: Icon(Iconsax.user_edit),
              ),
            ),
            SizedBox(height: AppSizes.spaceBtwInputFields),

            /// price controller
            TextFormField(
              keyboardType: TextInputType.number,
              controller: priceController,
              expands: false,
              decoration: InputDecoration(
                labelText: S.current.productPrice,
                prefixIcon: Icon(Iconsax.money),
              ),
            ),
            SizedBox(height: AppSizes.spaceBtwInputFields),

            /// whatsApp Number
            TextFormField(
              controller: whatsAppController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: S.current.whatsUp,
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

            /// size
            SizedBox(height: AppSizes.spaceBtwInputFields),

            /// quantity
            TextFormField(
              controller: quantityController,
              expands: false,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: S.current.quantity,
                prefixIcon: Icon(Iconsax.level),
              ),
            ),

            /// size
            SizedBox(height: AppSizes.spaceBtwInputFields),

            /// descreption
            TextFormField(
              expands: false,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: S.current.description,
                prefixIcon: Icon(Icons.description),
              ),
            ),

            /// size
            SizedBox(height: AppSizes.spaceBtwInputFields),

            ///product imagge
            InkWell(
              onTap: _openCamera,
              child: Container(
                width: double.infinity,
                height: 200.h,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorRes.greenBlue),
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

            /// size
            SizedBox(height: AppSizes.spaceBtwInputFields),

            /// Add Ad Button
            BlocBuilder<AddAdsCubit, AddAdsState>(
              builder: (context, state) {
                if (state is AddAdsLoading) {
                  return CustomUI.simpleLoader();
                } else if (state is AddAdsSuccess) {
                  context.pop();
                  commonToast(S.current.done);
                  return SizedBox();
                } else {
                  return InkWell(
                    onTap: () async {
                      if (productNameController.text.trim().isEmpty ||
                          quantityController.text.trim().isEmpty ||
                          priceController.text.trim().isEmpty ||
                          whatsAppController.text.trim().isEmpty ||
                          descreptionController.text.trim().isEmpty) {
                        addAdsController.addAdsUseCase(
                            params: FormData.fromMap({
                          "name": productNameController.text.trim(),
                          "added_by": userController.name,
                          "category_id": "489",
                          "city_id": userController.userModel.user?.cityID,
                          "location": userController.userModel.user?.countryID,
                          "photos": "1",
                          "thumbnail_img": await MultipartFile.fromFile(
                              _selectedImageFromCamera!.path!,
                              filename: _selectedImageFromCamera!.path!
                                  .split('/')
                                  .last),
                          "unit": quantityController.text.trim(),
                          "whats_app": whatsAppController.text.trim(),
                          "tags": [],
                          "description": descreptionController.text.trim()
                        }));
                      }
                    },
                    child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Center(child: Text(S.current.send))),
                  );
                }
              },
            )
          ],
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
