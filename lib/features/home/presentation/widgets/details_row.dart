import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/colors.dart';

class detailsRow extends StatelessWidget {
  String title, description;
  detailsRow({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.sp),
      child: Row(
        children: [
          // Product Name
          Expanded(
            flex: 7,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: ColorRes.black,
                  fontSize: 18.2.sp,
                  fontWeight: FontWeight.w900),
            ),
          ),
          // Spacer
          Spacer(),
          // Overview Text
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                  color: ColorRes.lightGreen,
                  borderRadius: BorderRadius.circular(10.sp)),
              child: Center(
                child: Text(
                  description,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ColorRes.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 16.sp),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
