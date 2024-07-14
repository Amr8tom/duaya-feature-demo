import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../routing/routes_name.dart';
import '../../../../../utils/constants/api_constants.dart';
import '../../controller/auth_controller_cubit.dart';

class DTermsAndConditionCheckbox extends StatelessWidget {
  DTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context.read<AuthControllerCubit>();
    final dark = DHelperFunctions.isDarkMode(context);
    return BlocConsumer<AuthControllerCubit, AuthControllerState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Row(
          children: [
            Container(
                width: 24.w,
                height: 24.h,
                child: Checkbox(
                    activeColor: ColorRes.greenBlue,
                    value: controller.isAgree,
                    onChanged: (value) {
                      controller.toggleCheckBox();
                    })),
            SizedBox(width: AppSizes.spaceBtwItems),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, DRoutesName.webViewRoute,
                    arguments: URL.privacyPolicy);
              },
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: S.current.iAgreeTo,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: ColorRes.black)),
                    TextSpan(
                        text: S.current.privacyPolicy,
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                              color: dark ? ColorRes.white : ColorRes.greenBlue,
                              decorationColor:
                                  dark ? ColorRes.white : ColorRes.greenBlue,
                            )),
                    TextSpan(
                        text: '', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: S.current.termsOfUse,
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: dark ? ColorRes.white : ColorRes.black,
                            decorationColor:
                                dark ? ColorRes.white : ColorRes.black,
                            overflow: TextOverflow.clip)),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
