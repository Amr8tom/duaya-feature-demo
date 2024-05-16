import 'package:duaya_app/features/authentication/presentation/signup/widgets/signup_form.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
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
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp),
        ),
        centerTitle: true,
        backgroundColor: ColorRes.primary.withOpacity(0.3),
      ),
      body: Stack(children: [
        Container(
          height: double.infinity,
          color: ColorRes.white,
        ),
        Container(
          child: Image.asset(
            AssetRes.backGroundImage,
            color: Colors.green,
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.md),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorRes.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: EdgeInsets.all(
                  AppSizes.sm,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Title
                    Text(S.current.letsStart,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontSize: 20.sp)),
                    SizedBox(height: AppSizes.spaceBtwSections),

                    /// Form
                    DSignupForm(),
                    SizedBox(height: AppSizes.spaceBtwSections / 2),
                  ],
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
