import 'dart:io';

import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/authentication/presentation/signup/widgets/TextFormWidget.dart';
import 'package:duaya_app/features/category/presentation/category/presentation/controller/categories_by_page_cubit.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import '../../../../../generated/l10n.dart';
import 'controller/expired_products_cubit.dart';

class AddNewProductScreen extends StatelessWidget {
  Map<String, dynamic> map;
  AddNewProductScreen({super.key, required this.map});

  /// Select

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpiredProductsCubit(),
      child: BlocConsumer<ExpiredProductsCubit, ExpiredProductsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final expiredController = context.read<ExpiredProductsCubit>();
          final categoriesController = context.read<CategoriesByPageCubit>();
          return Scaffold(
            appBar: DAppBar(
              title: Text(S.current.addProduct),
              centerTitle: true,
              showBackArrow: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(AppSizes.defaultSpace),
                child: Column(
                  children: [
                    /// Select product category
                    Text(
                      S.current.category,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(height: AppSizes.spaceBtwInputFields),

                    DropdownButtonFormField<String>(
                      items:
                          categoriesController.idsMapForCata.keys.map((item) {
                        return DropdownMenuItem<String>(
                          value: "$item",
                          child: Text("${item}"),
                        );
                      }).toList(),
                      onChanged: (value) {
                        /// get the id for the categoru and send it to the expiredCubit as the user selection
                        expiredController.categoryId.text = categoriesController
                            .idsMapForCata[value]
                            .toString()!;
                        print(expiredController.categoryId.text);
                      },
                    ),

                    /// Product name
                    TextWithTextField(
                      radius: 10,
                      hintIcon: Icon(
                        Iconsax.text,
                        size: 20,
                      ),
                      title: S.current.productName,
                      controller: expiredController.name,
                      isError: expiredController.errorName,
                    ),
                    SizedBox(height: AppSizes.spaceBtwInputFields),

                    /// Product description
                    TextWithTextField(
                      radius: 10,
                      hintIcon: Icon(
                        Iconsax.text,
                        size: 20,
                      ),
                      title: S.current.description,
                      controller: expiredController.description,
                      isError: expiredController.errorDescription,
                    ),

                    /// Expiry Date
                    Row(
                      children: [
                        Text(
                          S.current.expiryDate,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () async {
                        expiredController.selectDate(context);
                      },
                      child: TextField(
                        onTap: () async {
                          expiredController.selectDate(context);
                        },
                        controller: expiredController.expiredDate,
                        cursorColor: expiredController.errorExpiredDate
                            ? ColorRes.error2
                            : ColorRes.transparent,
                      ),
                    ),
                    SizedBox(height: AppSizes.spaceBtwInputFields),

                    /// Unit Price
                    TextWithTextField(
                      textType: TextInputType.numberWithOptions(decimal: true),
                      radius: 10,
                      hintIcon: Icon(
                        Icons.monetization_on,
                        size: 20,
                      ),
                      title: S.current.productPrice,
                      controller: expiredController.unitPrice,
                      isError: expiredController.errorUnit_price,
                    ),
                    SizedBox(height: AppSizes.spaceBtwInputFields),

                    /// Quantity

                    TextWithTextField(
                      textType: TextInputType.number,
                      radius: 10,
                      hintIcon: Icon(
                        Icons.shopping_bag_sharp,
                        size: 20,
                      ),
                      title: S.current.quantity,
                      controller: expiredController.currentStock,
                      isError: expiredController.errorCurrent_stock,
                    ),
                    SizedBox(height: AppSizes.spaceBtwInputFields),

                    SizedBox(height: AppSizes.spaceBtwInputFields),

                    SizedBox(height: AppSizes.spaceBtwInputFields),

                    /// Sign Up Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            expiredController.onSubmit(
                                context: context,
                                isUpdate: map["isUpdate"],
                                ID: map["ID"]);
                          },
                          // onPressed: () => Get.to(() => const VerifyEmailScreen()),
                          child: Text(
                            map["isUpdate"]
                                ? S.current.editProduct
                                : S.current.addProduct,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(color: Colors.white, fontSize: 25.sp),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
