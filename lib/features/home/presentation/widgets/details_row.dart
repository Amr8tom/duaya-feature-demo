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
                    color: ColorRes.primary,
                    fontSize: 15.2.sp,
                  ),
            ),
          ),
          // Spacer
          Spacer(),
          // Overview Text
          Expanded(
            flex: 7,
            child: Text(
              description,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontSize: 15.2.sp,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
