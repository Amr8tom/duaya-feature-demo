import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utils/constants/image_strings.dart';

class DLoginHeader extends StatelessWidget {
  const DLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = DHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
            child: Image(
          image: AssetImage(dark ? AssetRes.appIcon : AssetRes.appIcon),
          height: MediaQuery.of(context).size.height / 4,
        )),
        Text(S.current.loginTitle,
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: ColorRes.greenBlue, fontSize: 36.sp)),
        SizedBox(height: AppSizes.sm),
        Text(S.current.loginBody,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: ColorRes.black, fontSize: 14.sp)),
      ],
    );
  }
}
