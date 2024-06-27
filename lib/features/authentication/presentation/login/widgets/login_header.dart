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
      crossAxisAlignment: CrossAxisAlignment.start,
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
                ?.copyWith(color: Colors.red, fontSize: 41.sp)),
        SizedBox(height: AppSizes.sm),
        Center(
          child: Text(S.current.loginBody,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: ColorRes.buttonSecondary.withOpacity(0.6))),
        ),
      ],
    );
  }
}
