import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/colors.dart';

Widget buildPaymentMethodCard(BuildContext context, String title, IconData icon,
    void Function() onPressed) {
  return Card(
    elevation: 2,
    color: ColorRes.greenBlue,
    margin: EdgeInsets.symmetric(vertical: 10.0.sp, horizontal: 20.0.sp),
    child: ListTile(
      leading: Icon(icon, color: ColorRes.white, size: 40.0.sp),
      title: Text(title,
          style: TextStyle(
              fontSize: 20.0.sp,
              fontWeight: FontWeight.bold,
              color: ColorRes.white)),
      trailing: Icon(Icons.arrow_forward, color: ColorRes.white),
      onTap: onPressed,
    ),
  );
}
