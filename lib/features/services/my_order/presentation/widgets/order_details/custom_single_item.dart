import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../../utils/constants/colors.dart';

class CustomSingleItem extends StatelessWidget {
  final String itemName, itemCost, itemQutantity;
  final VoidCallback? onTap;
  final bool isRefundable;

  const CustomSingleItem(
      {super.key,
      required this.itemName,
      this.onTap,
      required this.isRefundable,
      required this.itemCost,
      required this.itemQutantity});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          // width: 350.w,
          // height: 160.h,
          decoration: BoxDecoration(
              border: Border.all(color: ColorRes.greenBlue),
              borderRadius: BorderRadius.circular(15.sp),
              color: ColorRes.greyGreen),
          child: Stack(children: [
            isRefundable
                ? Positioned(
                    top: 0,
                    left: 0,
                    child: TextButton(
                      onPressed: onTap,
                      child: Text(
                        "${S.current.sendItem}",
                        style: TextStyle(
                            color: ColorRes.error2,
                            fontWeight: FontWeight.w900,
                            fontSize: 12),
                      ),
                    ))
                : SizedBox(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                      decoration: BoxDecoration(
                          color: ColorRes.greenBlueLight,
                          borderRadius: BorderRadius.circular(15.sp)),
                      child: Lottie.asset(AssetRes.emptyProduct)),
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8.0.h, bottom: 12.h),
                        child: Text(
                          "$itemName",
                          style: TextStyle(
                            color: ColorRes.greenBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                      Text(
                        "${S.current.cost}: $itemCost",
                        style: TextStyle(
                          color: ColorRes.greenBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                      Text(
                        " ${S.current.quantity}: $itemQutantity",
                        style: TextStyle(
                          color: ColorRes.greenBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
