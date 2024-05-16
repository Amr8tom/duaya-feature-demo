import 'package:duaya_app/common/widgets/custom_button/custom_button_with_icon.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavigationInProduct extends StatelessWidget {
  final String textOfButton1, textOfButton2;
  final String? totalText, price;
  final bool isCart;
  final Color colorOfButton1,
      colorOfBorderOfButton1,
      colorOfButton2,
      colorOfBorderOfButton2,
      textButton1Color,
      textButton2Color;
  void Function()? onTap1;
  void Function()? onTap2;
  CustomBottomNavigationInProduct(
      {Key? key,
      required this.textOfButton1,
      this.onTap1,
      this.onTap2,
      required this.textOfButton2,
      this.totalText,
      this.price,
      required this.colorOfButton1,
      required this.colorOfBorderOfButton1,
      required this.colorOfButton2,
      required this.colorOfBorderOfButton2,
      required this.textButton1Color,
      required this.textButton2Color,
      required this.isCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.width;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height / 3.2,
      child: Column(
        children: [
          isCart
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(totalText!,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: ColorRes.primary),
                        overflow: TextOverflow.ellipsis),
                    Text(price!,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: ColorRes.primary, fontSize: 14.sp)),
                  ],
                )
              : const SizedBox.shrink(),
          SizedBox(height: AppSizes.defaultSpace),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.sp),
              child: Row(
                children: [
                  CustomButtonWithIcon(
                      textButton: textOfButton1,
                      width: width / 2.5,
                      color: colorOfButton1,
                      onTap: () {
                        onTap1!();
                      },
                      borderColor: colorOfBorderOfButton1,
                      textButtonColor: textButton1Color,
                      isAddToCart: false),
                  const Spacer(),
                  CustomButtonWithIcon(
                      textButton: textOfButton2,
                      width: width / 2.5,
                      color: colorOfButton2,
                      onTap: () {
                        onTap2!();
                      },
                      borderColor: colorOfBorderOfButton1,
                      textButtonColor: textButton2Color,
                      isAddToCart: false),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
