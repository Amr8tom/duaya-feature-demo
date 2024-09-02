import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../../utils/constants/colors.dart';

class CustomCardOrderDetailsInfo extends StatelessWidget {
  final String orderNumber,
      orderName,
      address,
      date,
      paymentStatus,
      paymentMethod,
      cost;
  const CustomCardOrderDetailsInfo(
      {super.key,
      required this.orderNumber,
      required this.orderName,
      required this.date,
      required this.paymentStatus,
      required this.paymentMethod,
      required this.address,
      required this.cost});

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "$orderNumber",
                style: TextStyle(
                  color: ColorRes.greenBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "${S.current.orderNumber} : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: ColorRes.greenBlue),
                        ),
                        Text(
                          "$orderNumber",
                          style: TextStyle(color: ColorRes.greenBlue),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "${S.current.history} : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: ColorRes.greenBlue),
                        ),
                        Text(
                          "$date",
                          style: TextStyle(color: ColorRes.greenBlue),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "${S.current.cost} : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: ColorRes.greenBlue),
                        ),
                        Text(
                          "$orderNumber",
                          style: TextStyle(color: ColorRes.greenBlue),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "${S.current.paymentStatus} : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: ColorRes.greenBlue),
                        ),
                        Text(
                          "$paymentStatus",
                          style: TextStyle(color: ColorRes.greenBlue),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "${S.current.choosePaymentMethod} : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: ColorRes.greenBlue),
                        ),
                        Text(
                          "$paymentMethod",
                          style: TextStyle(color: ColorRes.greenBlue),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
