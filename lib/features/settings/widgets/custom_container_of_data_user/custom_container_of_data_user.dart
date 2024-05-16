import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../authentication/presentation/controller/auth_controller_cubit.dart';

class CustomContainerOfDataUser extends StatelessWidget {
  const CustomContainerOfDataUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final authController = context.read<AuthControllerCubit>();
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: AppSizes.spaceBtwItems, vertical: AppSizes.spaceBtwItems),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
        color: ColorRes.primary.withOpacity(0.4),
        boxShadow: [
          BoxShadow(
            color: ColorRes.black.withOpacity(.3),
            blurRadius: 2,
            spreadRadius: 1,
            offset: Offset(1.w, 1.h),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 27.r,
            backgroundColor: ColorRes.white,
            child: CircleAvatar(
              radius: 25.r,
              backgroundColor: ColorRes.primary.withOpacity(0.6),
              child: Center(
                child: Text(authController.userModel.user!.jobName!,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontSize: 16.sp, color: ColorRes.white)),
              ),
            ),
          ),
          SizedBox(width: AppSizes.spaceBtwItems),
          Column(
            children: [
              Text(authController.userModel.user!.name!,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontSize: 16.sp, color: ColorRes.white)),
              SizedBox(height: AppSizes.spaceBtwItems / 2),
              Text(authController.userModel.user!.email!,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontSize: 16.sp, color: ColorRes.white)),
            ],
          ),
          const Spacer(),
          Icon(Iconsax.edit, color: ColorRes.white, size: 20.sp)
        ],
      ),
    );
  }
}
