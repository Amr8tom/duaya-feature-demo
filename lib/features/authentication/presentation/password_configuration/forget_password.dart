import 'package:duaya_app/common/widgets/custom_button/custom_button.dart';
import 'package:duaya_app/common/widgets/custom_popup_menu/custom_popup_menu.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/formatters/formatter.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../generated/l10n.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  bool isShowed = true;
  String selectedCountryCode = '+20';

  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Form(
          key: forgetPasswordFormKey,
          child: Padding(
            padding: EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Headings
                Text(S.current.forgetPassword,
                    style: Theme.of(context).textTheme.headlineMedium),
                SizedBox(height: AppSizes.spaceBtwItems),
                Text(S.current.forgetPasswordBody,
                    style: Theme.of(context).textTheme.labelMedium),
                SizedBox(height: AppSizes.spaceBtwItems * 2),

                /// Phone Number
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: S.current.phoneNumber,
                    suffixIcon: const Icon(Iconsax.call),
                    prefixIcon: CustomPopupMenu(
                        textWidget: Text(selectedCountryCode.toString()),
                        onSelected: (String value) =>
                            setState(() => selectedCountryCode = value)),
                  ),
                  validator: (value) =>
                      DFormatter.formatPhoneNumber(value, selectedCountryCode),
                ),
                SizedBox(height: AppSizes.spaceBtwItems * 2),

                /// Submit Button
                CustomButton(
                    buttonText: S.current.forgetPassword,
                    onPressed: () => context.pushNamed(
                        DRoutesName.verifyCodeRoute,
                        arguments: phoneController.text)),
              ],
            ),
          ),
        ));
  }
}
