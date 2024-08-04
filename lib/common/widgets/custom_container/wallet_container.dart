import 'package:duaya_app/features/services/presentation/wallet/presentation/controller/wallet_cubit.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContanerWallet extends StatelessWidget {
  String image;
  String title;
  String pinText;
  String body;
  CustomContanerWallet(
      {Key? key,
      required this.image,
      required this.title,
      required this.pinText,
      required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    WalletCubit walletController = context.read<WalletCubit>();
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<WalletCubit, WalletState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Card(
          child: Container(
            width: double.infinity,
            height: height / 8,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
              color: ColorRes.white,
            ),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: ColorRes.greenBlueLight,
                          borderRadius: BorderRadius.circular(10.r)),
                      padding: EdgeInsets.symmetric(
                          vertical: 25.sp, horizontal: 20.sp),
                      child: Image.asset(image),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                      fontSize: 16.sp,
                                      color: ColorRes.greenBlue)),
                          SizedBox(height: AppSizes.spaceBtwTexts * 3),
                          Text(body,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                      fontSize: 10.sp,
                                      color: ColorRes.grey,
                                      fontWeight: FontWeight.w900)),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Text(pinText,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                              fontSize: 16.sp, color: ColorRes.greenBlue)),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
