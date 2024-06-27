import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../authentication/presentation/controller/auth_controller_cubit.dart';
import '../../presentation/controller/translation_cubit.dart';

class CustomContainerOfDataUser extends StatelessWidget {
  const CustomContainerOfDataUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = context.read<AuthControllerCubit>();
    final settingController = context.read<SettinglationCubit>();
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: AppSizes.spaceBtwItems),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
        color: ColorRes.lightGreen.withOpacity(0.5),
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
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(authController.userModel.user!.name!,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontSize: 16.sp, color: ColorRes.white))
                ],
              ),
              settingController.profileModel.vipStatus == 1
                  ? Row(
                      children: [
                        Text("VIP ",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    fontSize: 20.sp, color: ColorRes.error2)),
                        Icon(
                          Iconsax.crown1,
                          size: 35.sp,
                          color: ColorRes.error2,
                        ),
                        SizedBox(
                          width: AppSizes.defaultSpace,
                        ),
                      ],
                    )
                  : SizedBox(),
              SizedBox(height: AppSizes.spaceBtwItems / 2),
              Container(
                width: 220.sp,
                child: Text(authController.userModel.user!.email!,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 16.sp,
                        color: ColorRes.white,
                        overflow: TextOverflow.ellipsis)),
              ),
            ],
          ),
          SizedBox(width: AppSizes.spaceBtwItems * 3),
          Column(
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundColor: ColorRes.white,
                child: CircleAvatar(
                  radius: 25.r,
                  backgroundColor: ColorRes.gold.withOpacity(0.6),
                  child: Center(
                    child: Text(authController.userModel.user!.jobName!,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                fontSize: 16.sp,
                                color: ColorRes.white,
                                overflow: TextOverflow.ellipsis)),
                  ),
                ),
              ),
              settingController.profileModel.verificationStatus == 0
                  ? Icon(Icons.dangerous_outlined,
                      color: ColorRes.error2, size: 50.sp)
                  : Icon(Icons.check_box, color: ColorRes.white, size: 40.sp),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
