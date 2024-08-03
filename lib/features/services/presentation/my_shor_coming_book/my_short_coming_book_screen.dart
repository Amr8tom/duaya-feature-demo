import 'dart:io';
import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/services/presentation/my_shor_coming_book/presentation/controller/short_coming_cubit.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../generated/l10n.dart';

class ShortComingScreen extends StatelessWidget {
  ShortComingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShortComingCubit(),
      child: BlocConsumer<ShortComingCubit, ShortComingState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          ShortComingCubit shortComingController =
              context.read<ShortComingCubit>();
          return Scaffold(
            appBar: DAppBar(
              title: Text(S.current.ShortComing),
              centerTitle: true,
              showBackArrow: true,
            ),
            body: Padding(
                padding: EdgeInsets.all(AppSizes.spaceBtwItems),
                child: Column(
                  children: [
                    SizedBox(height: AppSizes.spaceBtwInputFields),
                    InkWell(
                      onTap: () async {
                        await shortComingController.openImageGallery(
                            context: context);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 260.h,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: ColorRes.greenBlue, width: 2),
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: shortComingController.selectedImage != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(14.r),
                                child: Image.file(
                                  File(shortComingController
                                      .selectedImage!.path),
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              )
                            : Center(
                                child: Column(
                                  children: [
                                    Lottie.asset(AssetRes.shortComingBook2,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                5.2),
                                    Spacer(),
                                    Text(
                                      S.current.uploadFileOrExcelSheet,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .copyWith(color: ColorRes.black),
                                    ),
                                    SizedBox(
                                        height: AppSizes.spaceBtwInputFields),
                                  ],
                                ),
                              ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () async {
                        await shortComingController.openCamera(
                            context: context);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 260.h,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: ColorRes.greenBlue, width: 2),
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: shortComingController.selectedImageFromCamera !=
                                null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(14.r),
                                child: Image.file(
                                  File(shortComingController
                                      .selectedImageFromCamera!.path),
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              )
                            : Center(
                                child: Column(
                                  children: [
                                    Lottie.asset(AssetRes.shortComingBook,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                5.2),
                                    Spacer(),
                                    Text(S.current.takeCameraPhoto,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium!
                                            .copyWith(color: ColorRes.black)),
                                    SizedBox(
                                        height: AppSizes.spaceBtwInputFields),
                                  ],
                                ),
                              ),
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                        style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all<Size>(
                                Size(260.w, 70.h)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                ColorRes.greenBlueLight)),
                        onPressed: () {
                          shortComingController.updateFormData(
                              context: context);
                        },
                        child: Text(
                          S.current.sendMyShortComingBook,
                          style: TextStyle(
                              color: ColorRes.greenBlue, fontSize: 18.sp),
                        )),
                    SizedBox(height: AppSizes.spaceBtwInputFields),
                  ],
                )),
            // floatingActionButton: const CustomFloatingActionButton(textButton: 'Create Order'),
          );
        },
      ),
    );
  }
}
