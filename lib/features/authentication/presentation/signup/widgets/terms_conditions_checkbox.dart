import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../utils/constants/api_constants.dart';

class DTermsAndConditionCheckbox extends StatelessWidget {
  const DTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = DHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        SizedBox(
            width: 24.w,
            height: 24.h,
            child: Checkbox(value: true, onChanged: (value) {})),
        SizedBox(width: AppSizes.spaceBtwItems),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: S.current.iAgreeTo,
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: S.current.privacyPolicy,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: dark ? ColorRes.white : ColorRes.primary,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              dark ? ColorRes.white : ColorRes.primary,
                        )),
                TextSpan(
                    text: '', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: S.current.termsOfUse,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? ColorRes.white : ColorRes.primary,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            dark ? ColorRes.white : ColorRes.primary,
                        overflow: TextOverflow.clip)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
