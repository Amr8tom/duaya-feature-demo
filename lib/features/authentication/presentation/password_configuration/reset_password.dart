import 'package:duaya_app/common/widgets/custom_button/custom_button.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/formatters/formatter.dart';
import 'package:duaya_app/utils/helpers/helper_functions.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../generated/l10n.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool isShowedNewPassword = true;
  bool isShowedConfirmNewPassword = true;
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  var resetPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Form(
            key: resetPasswordFormKey,
            child: Column(
              children: [
                /// Image
                SizedBox(
                  height: AppSizes.xxl,
                ),
                Image(
                    image: const AssetImage(AssetRes.appLogo),
                    width: DHelperFunctions.screenWidth(context) * 0.6),
                SizedBox(height: AppSizes.spaceBtwItems),

                /// Title & SubTitle
                Text(S.current.emailPasswordSend,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center),
                SizedBox(height: AppSizes.spaceBtwItems),

                SizedBox(height: AppSizes.spaceBtwInputFields),

                /// New Password
                TextFormField(
                  controller: newPasswordController,
                  obscureText: isShowedNewPassword,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.password_check),
                    labelText: S.current.password,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isShowedNewPassword = !isShowedNewPassword;
                          });
                        },
                        icon: Icon(isShowedNewPassword
                            ? Iconsax.eye_slash
                            : Iconsax.eye)),
                  ),
                  validator: (value) => DFormatter.formatPassword(value),
                ),

                SizedBox(height: AppSizes.spaceBtwInputFields),

                /// Confirm New Password
                TextFormField(
                  controller: confirmNewPasswordController,
                  obscureText: isShowedConfirmNewPassword,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.password_check),
                    labelText: S.current.confirmPassword,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isShowedConfirmNewPassword =
                                !isShowedConfirmNewPassword;
                          });
                        },
                        icon: Icon(isShowedConfirmNewPassword
                            ? Iconsax.eye_slash
                            : Iconsax.eye)),
                  ),
                  validator: (value) => DFormatter.formatPassword(value),
                ),

                SizedBox(height: AppSizes.spaceBtwSections),

                /// Buttons
                CustomButton(
                    buttonText: S.current.done,
                    onPressed: () => context.pushNamed(DRoutesName.loginRoute)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
