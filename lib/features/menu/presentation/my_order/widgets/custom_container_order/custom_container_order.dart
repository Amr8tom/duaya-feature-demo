import 'package:duaya_app/common/widgets/custom_button/custom_button_with_icon.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerOrder extends StatelessWidget {
  const CustomContainerOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: AppSizes.spaceBtwTexts),
      padding: EdgeInsets.symmetric(
          horizontal: AppSizes.spaceBtwItems,
          vertical: AppSizes.spaceBtwItems * 1.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
        color: ColorRes.grey3,
        boxShadow: [
          BoxShadow(
            color: ColorRes.black.withOpacity(.3),
            blurRadius: 2,
            spreadRadius: 1,
            offset: Offset(1.w, 1.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('On the wat to you',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: ColorRes.primary)),
              Text('\$235,00',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: ColorRes.error2)),
            ],
          ),
          SizedBox(height: AppSizes.spaceBtwTexts),
          Text('Bill NO.23455-64327',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontSize: 20.sp, color: ColorRes.black)),
          SizedBox(height: AppSizes.spaceBtwTexts),
          Text('ordered 20/11/2023',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: ColorRes.black)),
          SizedBox(height: AppSizes.spaceBtwItems * 1.5),
          Text("${S.current.paymentStatus}: ",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: ColorRes.silver)),
          SizedBox(height: AppSizes.spaceBtwTexts),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(S.current.paymentwhenReceiving,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 15.sp, color: ColorRes.black)),
              CustomButtonWithIcon2(
                  onTap: () {},
                  textButton: S.current.myOrder,
                  color: ColorRes.primary,
                  height: AppSizes.spaceBtwItems * 2.5,
                  width: AppSizes.padding * 6,
                  borderColor: Colors.transparent,
                  textButtonColor: ColorRes.white,
                  isAddToCart: true),
            ],
          )
        ],
      ),
    );
  }
}
