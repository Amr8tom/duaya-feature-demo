import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerTransactionHistory extends StatelessWidget {
  const CustomContainerTransactionHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.spaceBtwTexts * 2),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(AppSizes.spaceBtwItems),
          decoration: BoxDecoration(
            color: ColorRes.white,
            boxShadow: [
              BoxShadow(
                color: ColorRes.black.withOpacity(.2),
                blurRadius: 2,
                spreadRadius: 1,
                offset: Offset(1.w, 1.h),
              ),
            ],
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
            border: Border.all(
                width: 0.5.w,
                color: ColorRes.grey),
          ),
          child: Row(
            children: [
              Text(S.current.transactionHistory,style: Theme.of(context).textTheme.titleLarge),
              const Spacer(),
              Text(S.current.seeAll,style: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorRes.silver, fontSize: 15.sp)),
              Icon(Icons.arrow_forward_ios,size: 17.sp,color:  ColorRes.silver),
            ],
          ),
        ),
      ),
    );
  }
}
