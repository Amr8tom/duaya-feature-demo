import 'package:duaya_app/common/widgets/cached_image/cached_image.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../generated/l10n.dart';
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
      child: Stack(alignment: AlignmentDirectional.topEnd, children: [
        settingController.profileModel.verificationStatus == 0
            ? Icon(Icons.dangerous_outlined,
                color: ColorRes.error2, size: 45.sp)
            : Icon(Icons.check_circle_outline,
                color: ColorRes.white, size: 45.sp),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundColor: ColorRes.greenBlueLight,
                child: CachedImage(
                    height: 50.h,
                    link: authController.userModel.user!.avatarOriginal!),
              ),
              Text(authController.userModel.user!.name!,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontSize: 16.sp, color: ColorRes.white)),

              SizedBox(height: AppSizes.spaceBtwItems / 2),
              Text(authController.userModel.user!.email!,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: ColorRes.white,
                      overflow: TextOverflow.ellipsis)),

              /// show vip status
              settingController.profileModel.vipStatus == 1
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("VIP ",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    fontSize: 20.sp, color: ColorRes.error2)),
                        SizedBox(
                          width: AppSizes.defaultSpace,
                        ),
                        Icon(
                          Iconsax.crown1,
                          size: 35.sp,
                          color: ColorRes.error2,
                        ),
                      ],
                    )
                  : SizedBox(),

              /// in case that not verified
              settingController.profileModel.verificationStatus == 0
                  ? Text(S.current.notVerified,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Cairo",
                              color: ColorRes.error2,
                              overflow: TextOverflow.ellipsis))
                  : SizedBox(),
            ],
          ),
        ),
      ]),
    );
  }
}
