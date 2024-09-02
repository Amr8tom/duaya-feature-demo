import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../common/common_snak_bar_widget.dart';
import '../../../../../common/text_record_function.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../routing/routes_name.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/constants.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../chat/presentation/controller/chat_controller.dart';
import '../custom_container_menu/custom_container_menu.dart';

class CustomServiceList extends StatefulWidget {
  const CustomServiceList({super.key});

  @override
  State<CustomServiceList> createState() => _CustomServiceListState();
}

class _CustomServiceListState extends State<CustomServiceList> {
  int selectedIndex = -1; // Track the index of the selected item
  bool isHelpWithAvatar = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
          padding: EdgeInsets.symmetric(
              horizontal: AppSizes.spaceBtwItems,
              vertical: AppSizes.defaultSpace),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: AppSizes.imageSize,
              // crossAxisSpacing: AppSizes.padding * 1,
              childAspectRatio: 5 / 3.5),
          shrinkWrap: true,
          itemCount: DConstants.iconOfMenu.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                setState(() {
                  selectedIndex = index; // Update the selected index
                });

                // Handle navigation or text-to-speech logic
                if (isHelpWithAvatar) {
                  switch (index) {
                    case 0:
                      context.pushNamed(DRoutesName.walletRoute);
                      break;
                    case 1:
                      context.pushNamed(DRoutesName.myAdsRoute);
                      break;
                    case 2:
                      context.pushNamed(DRoutesName.customerAdsRoute);
                      break;
                    case 3:
                      context.pushNamed(DRoutesName.myNoteBookRoute);
                      break;
                    case 4:
                      context.pushNamed(DRoutesName.medicalServiceRoute);
                      break;
                    case 5:
                      context.pushNamed(DRoutesName.expireProductRoute);
                      break;
                    case 6:
                      openWhatsAppChat();
                      break;

                    default:
                      break;
                  }
                } else {
                  switch (index) {
                    case 0:
                      speak(
                          statements: S.current.wallet,
                          locale: S.current.localeee);
                      break;
                    case 1:
                      speak(
                          statements: S.current.stagnantItems,
                          locale: S.current.localeee);
                      break;
                    case 2:
                      speak(
                          statements: S.current.customerStagnantItems,
                          locale: S.current.localeee);
                      break;
                    case 3:
                      speak(
                          statements: S.current.sendNotebook,
                          locale: S.current.localeee);
                      break;
                    case 4:
                      speak(
                          statements: S.current.medicalServices,
                          locale: S.current.localeee);
                      break;
                    case 5:
                      speak(
                          statements: S.current.expiredProducts,
                          locale: S.current.localeee);
                      break;

                    case 6:
                      speak(
                          statements: S.current.speakToUs,
                          locale: S.current.localeee);
                      break;

                    default:
                      break;
                  }
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: selectedIndex == index
                        ? ColorRes.primary
                        : Colors.transparent,
                    // Optional: highlight border color for the selected item
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: selectedIndex == index
                    ? Lottie.asset(
                        AssetRes.rebot1,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      )
                    : CustomContainerMenu(
                        text: _textOfMenu[index],
                        iconData: DConstants.iconOfMenu[index],
                      ),
              ),
            );
          },
        ),
        Positioned(
          bottom: 2.sp,
          right: 10,
          child: IconButton(
            onPressed: () {
              setState(() {
                isHelpWithAvatar = !isHelpWithAvatar; // Toggle the state
              });
              commonToast(
                  "لقد تم تشغيل المساعده الصوتية انقر علي الايكونات المتاحة امامك لمعرفة خاصية كل واحدة منهم");
            },
            icon: Column(
              children: [
                Icon(
                  isHelpWithAvatar ? Icons.help : Icons.help_outline,
                  size: 40.sp,
                  color: ColorRes.lightGreen,
                ),
                Text(S.current.helper),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

List<String> _textOfMenu = [
  S.current.myWallet,
  S.current.myStagnantCategories,
  S.current.stagnantCategories,
  S.current.ShortComing,
  S.current.medicalService,
  S.current.expiredProduct,
  S.current.chatUs,
];
