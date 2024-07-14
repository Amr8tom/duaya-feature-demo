import 'package:duaya_app/features/authentication/presentation/signup/widgets/signup_form.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = DHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.current.appName,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: ColorRes.greenBlue),
        ),
        centerTitle: true,
        backgroundColor: ColorRes.grey.withOpacity(0.2),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.md),
          child: Padding(
            padding: EdgeInsets.all(
              AppSizes.sm,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title
                Center(
                  child: Text(S.current.letsStart,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              fontSize: 28.sp, color: ColorRes.greenBlue)),
                ),
                SizedBox(height: AppSizes.spaceBtwSections),

                /// Form
                DSignupForm(),
                SizedBox(height: AppSizes.spaceBtwSections / 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
