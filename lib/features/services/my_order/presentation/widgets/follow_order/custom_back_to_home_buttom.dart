import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../generated/l10n.dart';
import '../../../../../../../utils/constants/colors.dart';

class CustomBackToHomeButtom extends StatelessWidget {
  const CustomBackToHomeButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context.pushNamed(DRoutesName.navigationMenuRoute);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Text(
            S.current.backToHome,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: ColorRes.white),
          ),
        ));
  }
}
