import 'package:duaya_app/features/flash/presentation/controller/flash_cubit.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CustomTimeLeftInFlashSale extends StatelessWidget {
  const CustomTimeLeftInFlashSale({super.key});

  @override
  Widget build(BuildContext context) {
    final flashController = context.read<FlashCubit>();
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(AppSizes.padding),
        decoration: BoxDecoration(
          color: ColorRes.white,
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
        ),
        child: Column(
          children: [
            SizedBox(height: AppSizes.defaultSpace / 2),

            Text(S.current.saleTime,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: ColorRes.greenBlue,
                    height: .5.h,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600)),
            SizedBox(height: AppSizes.defaultSpace * 2),
            Lottie.asset(AssetRes.coloredSale,
                width: AppSizes.defaultSpace * 9, fit: BoxFit.fill),

            /// Times
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(flashController.hours.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: ColorRes.greenBlue,
                                height: .5.h,
                                fontSize: 16.sp)),
                    SizedBox(height: AppSizes.defaultSpace / 2),
                    Text(S.current.hours,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: ColorRes.greenBlue,
                                height: .5.h,
                                fontSize: 16.sp)),
                  ],
                ),
                Text(':',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorRes.greenBlue,
                        height: .5.h,
                        fontSize: 16.sp)),
                Column(
                  children: [
                    Text(flashController.minutes.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: ColorRes.greenBlue,
                                height: .5.h,
                                fontSize: 16.sp)),
                    SizedBox(height: AppSizes.defaultSpace / 2),
                    Text(S.current.minutes,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: ColorRes.greenBlue,
                                height: .5.h,
                                fontSize: 16.sp)),
                  ],
                ),
                Text(':',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorRes.greenBlue,
                        height: .5.h,
                        fontSize: 16.sp)),
                Column(
                  children: [
                    Text(flashController.seconds.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: ColorRes.greenBlue,
                                height: .5.h,
                                fontSize: 16.sp)),
                    SizedBox(height: AppSizes.defaultSpace / 2),
                    Text(S.current.seconds,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: ColorRes.greenBlue,
                                height: .5.h,
                                fontSize: 16.sp)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
