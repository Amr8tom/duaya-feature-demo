import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../controller/auth_controller_cubit.dart';

class DLoginForm extends StatelessWidget {
  const DLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthControllerCubit controller = context.read<AuthControllerCubit>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: S.current.eMail),
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
                  obscureText: !controller
                      .isPasswordVisible, // Hides the text if isPasswordVisible is false
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.password_check),
                    labelText: S.current.password,
                    suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordVisible
                              ? Iconsax.eye
                              : Iconsax
                                  .eye_slash, // Toggle icon based on visibility state
                        ),
                        onPressed: () {
                          controller
                              .showPassword(); // Toggle the visibility state
                        }),
                  ),
                );
              },
            ),
            SizedBox(height: AppSizes.spaceBtwInputFields / 2),

            /// Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me
                // Row(
                //   children: [
                //     Checkbox(
                //       value: true,
                //       onChanged: (value) {},
                //     ),
                //     Text(S.current.rememberMe),
                //   ],
                // ),

                /// Forget Password
                TextButton(
                    onPressed: () =>
                        context.pushNamed(DRoutesName.forgetPasswordRoute),
                    child: Text(S.current.forgetPassword)),
              ],
            ),
            SizedBox(height: AppSizes.spaceBtwSections),

            /// Sign In Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      controller.fetchLoadingData(
                          password: passwordController.text,
                          email: emailController.text,
                          context: context);
                    },
                    child: Text(S.current.singIn))),
            SizedBox(height: AppSizes.spaceBtwItems),

            /// Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () => context.pushNamed(DRoutesName.signupRoute),
                  child: Text(S.current.createAccount)),
            ),
          ],
        ),
      ),
    );
  }
}
