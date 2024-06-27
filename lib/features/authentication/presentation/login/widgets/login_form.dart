import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../controller/auth_controller_cubit.dart';

class DLoginForm extends StatelessWidget {
  const DLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthControllerCubit controller = context.read<AuthControllerCubit>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    String? emailValidator(String? value) {
      if (value == null || value.isEmpty) {
        return S.current.pleaseEndterValue;
      }
      String pattern = r'^[^@]+@[^@]+\.[^@]+';
      RegExp regex = RegExp(pattern);
      if (!regex.hasMatch(value)) {
        return S.current.invalidEmail;
      }
      return null;
    }

    String? passwordValidator(String? value) {
      if (value == null || value.isEmpty) {
        return S.current.pleaseEndterValue;
      }
      if (value.length < 4) {
        return S.current.passwordTooShort;
      }
      return null;
    }

    void _submit() {
      if (_formKey.currentState?.validate() ?? false) {
        controller.fetchLoginData(
          password: passwordController.text.trim(),
          email: emailController.text.trim(),
          context: context,
        );
      }
    }

    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              controller: emailController,
              validator: emailValidator,
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: S.current.eMail,
              ),
            ),
            SizedBox(height: AppSizes.spaceBtwInputFields),

            /// Password
            BlocConsumer<AuthControllerCubit, AuthControllerState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return TextFormField(
                  controller: passwordController,
                  obscureText: !controller.isPasswordVisible,
                  validator: passwordValidator,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.password_check),
                    labelText: S.current.password,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible
                            ? Iconsax.eye
                            : Iconsax.eye_slash,
                      ),
                      onPressed: () {
                        controller.showPassword();
                      },
                    ),
                  ),
                );
              },
            ),

            /// Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Forget Password
                TextButton(
                  onPressed: () =>
                      context.pushNamed(DRoutesName.forgetPasswordRoute),
                  child: Text(
                    S.current.forgetPassword,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.red, fontSize: 17.sp),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSizes.spaceBtwSections),

            /// Sign In Button
            InkWell(
              onTap: _submit,
              child: Container(
                decoration: BoxDecoration(
                  color: ColorRes.lightGreen.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(50.sp),
                ),
                width: 300.sp,
                height: 60.sp,
                child: Center(
                  child: Text(
                    S.current.singIn,
                    style: TextStyle(
                      fontSize: 25.sp,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: AppSizes.spaceBtwItems),

            /// Create Account Button
            InkWell(
              onTap: () =>
                  context.pushReplacementNamed(DRoutesName.signupRoute),
              child: Container(
                width: 300.sp,
                height: 60.sp,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(50.sp),
                  color: ColorRes.white.withOpacity(0.9),
                ),
                child: Center(
                  child: Text(
                    S.current.newCilent,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: Colors.red, fontSize: 25.sp),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
