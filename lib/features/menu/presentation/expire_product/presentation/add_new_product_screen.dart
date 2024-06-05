import 'dart:io';

import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/menu/presentation/expire_product/widgets/date_input_formatter.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import '../../../../generated/l10n.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  /// Select
  List<String> works = [S.current.pharmacy, S.current.clinic, S.current.hospital, S.current.lab];
  String? selectWork = S.current.pharmacy;
  XFile? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  DAppBar(
        title: Text(S.current.addProduct),
        centerTitle: true,
        showBackArrow: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              /// Product name
              TextFormField(
                expands: false,
                decoration:  InputDecoration(
                  labelText: S.current.productName,
                  prefixIcon: Icon(Iconsax.text),
                ),
              ),
              SizedBox(height: AppSizes.spaceBtwInputFields),

              /// Product description
              TextFormField(
                expands: false,
                maxLines: 5,
                decoration:  InputDecoration(
                  labelText: S.current.productDescription,
                  prefixIcon: Icon(Iconsax.text),
                ),
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

              /// Expiry Date
              TextFormField(
                expands: false,
                keyboardType: TextInputType.datetime,

                decoration: const InputDecoration(
                  labelText: '20/5/1990',
                  prefixIcon: Icon(Iconsax.calendar),
                ),
                inputFormatters: [DateInputFormatter()],
              ),
              SizedBox(height: AppSizes.spaceBtwInputFields),

              /// Unit Price
              TextFormField(
                expands: false,
                decoration: InputDecoration(
                  labelText: S.current.unitPrice,
                  prefixIcon: Icon(Iconsax.money),
                ),
              ),
              SizedBox(height: AppSizes.spaceBtwInputFields),

              /// Quantity
              TextFormField(
                expands: false,
                decoration:  InputDecoration(
                  labelText: S.current.quantity,
                  prefixIcon: Icon(Iconsax.text),
                ),
              ),
              SizedBox(height: AppSizes.spaceBtwInputFields),

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
                        Lottie.asset(AssetRes.uploadImage, height: MediaQuery.of(context).size.height / 5.2),
                        Text(S.current.chooseImage, style: const TextStyle().copyWith(fontSize: 12.8.sp, color: Colors.black),)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSizes.spaceBtwInputFields),

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
                        Lottie.asset(AssetRes.uploadImage, height: MediaQuery.of(context).size.height / 5.2),
                        Text(S.current.chooseImage, style: const TextStyle().copyWith(fontSize: 12.8.sp, color: Colors.black),)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSizes.spaceBtwInputFields),

              /// Sign Up Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    // onPressed: () => Get.to(() => const VerifyEmailScreen()),
                    child: Text(S.current.done)),
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
