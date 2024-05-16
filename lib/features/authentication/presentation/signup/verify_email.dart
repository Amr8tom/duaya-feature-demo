import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/helper_functions.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => context.pop,
              icon: const Icon(Icons.close))
        ],
      ),
      body: SingleChildScrollView(
        /// Padding to Give Default Equal Space on all sides in all screens.
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              /// Images
              Image(
                  image: const AssetImage(AssetRes.deliveredEmailIllustration),
                  width: DHelperFunctions.screenWidth(context) * 0.6),
              SizedBox(height: AppSizes.spaceBtwItems),

              /// Title & SubTitle
              Text('Verify your email address!',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              SizedBox(height: AppSizes.spaceBtwItems),
              Text('3omarabdelaziz123@gmail.com',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              SizedBox(height: AppSizes.spaceBtwItems),
              Text('Congratulations! Your Account Awaits: Verify Your Email to Start Shopping and Experience a World of Unrivaled Deals and Personalized Offers.',
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              SizedBox(height: AppSizes.spaceBtwItems),

              /// Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                      // onPressed: () => Get.to(() => SuccessScreen(
                      //       image: AssetRes.productsSuccessIllustration,
                      //       title: TTexts.yourAccountCreatedTitle,
                      //       subTitle: TTexts.yourAccountCreatedSubTitle,
                      //       onPressed: () => Get.to(() => const LoginScreen()),
                      //     )),
                      child: Text(S.current.coontinue))),
              SizedBox(height: AppSizes.spaceBtwItems),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {}, child:  Text(S.current.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
