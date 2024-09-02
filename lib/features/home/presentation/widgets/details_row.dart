import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/colors.dart';

class detailsRow extends StatelessWidget {
  String title, description;
  detailsRow({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Product Name
        Text(
          title + " : ",
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Colors.grey, fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        // Overview Text
        Center(
          child: Text(
            description,
            maxLines: 10,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp),
          ),
        ),
      ],
    );
  }
}
