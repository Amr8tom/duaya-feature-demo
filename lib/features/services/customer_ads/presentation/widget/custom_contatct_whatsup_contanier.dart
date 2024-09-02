import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../utils/constants/colors.dart';

class CustomContatctWhatsupContanier extends StatelessWidget {
  final int? Phone;
  const CustomContatctWhatsupContanier({super.key, this.Phone});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 160.w,
        height: 34.h,
        child: Container(
          decoration: BoxDecoration(
              color: ColorRes.greenBlue,
              borderRadius: BorderRadius.circular(15.sp)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(S.current.contactWithClient,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: ColorRes.white, fontSize: 16.sp)),
              SvgPicture.asset(AssetRes.whatsappIconWhite)
            ],
          ),
        ),
      ),
    );
  }
}
