// import 'package:duaya_app/common/widgets/custom_button/custom_button.dart';
// import 'package:duaya_app/utils/constants/colors.dart';
// import 'package:duaya_app/utils/constants/exports.dart';
// import 'package:duaya_app/utils/constants/image_strings.dart';
// import 'package:duaya_app/utils/constants/sizes.dart';
// import 'package:duaya_app/utils/device/device_utility.dart';
// import 'package:duaya_app/utils/helpers/navigation_extension.dart';
// import 'package:duaya_app/utils/language/language_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class NoConnectionScreen extends StatelessWidget {
//   const NoConnectionScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: DDeviceUtils.getScreenWidth(context) * .05),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               /// No Connection Image
//               SvgPicture.asset(AssetRes.noConnection, width: AppSizes.buttonWidth, height: AppSizes.productItemHeight),
//               SizedBox(height: AppSizes.spaceBtwSections),
//
//               /// Title Text, SubTitleText
//               Text("connectionLost".tr(context), style: Theme.of(context).textTheme.titleLarge),
//               SizedBox(height: AppSizes.dividerHeight * 8),
//               Text("pleaseCheckYourInternet".tr(context), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorRes.darkGrey),),
//               SizedBox(height: AppSizes.spaceBtwSections),
//
//               /// Button (Try Again)
//               CustomButton(buttonText: "dContinue".tr(context), onPressed: () => context.pop()),
//               // SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => context.pop(), child: Text("dContinue".tr(context), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: OColors.white),))),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
