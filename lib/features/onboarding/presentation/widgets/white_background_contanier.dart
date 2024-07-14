import 'package:duaya_app/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class whiteBachGround extends StatelessWidget {
  const whiteBachGround({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorRes.greenBlue,
      child: Column(
        children: [
          Spacer(),
          Container(
            height: 539.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.r),
                  topRight: Radius.circular(50.r)),
              color: ColorRes.white,
            ),
          )
        ],
      ),
    );
  }
}
