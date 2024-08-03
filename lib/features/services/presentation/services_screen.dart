import 'package:duaya_app/common/common_snak_bar_widget.dart';
import 'package:duaya_app/common/text_record_function.dart';
import 'package:duaya_app/features/services/presentation/widget/custom_container_menu/custom_container_menu.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/constants.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../generated/l10n.dart';
import 'chat/presentation/controller/chat_controller.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);
  @override
  State<ServicesScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<ServicesScreen> {
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
                      context.pushNamed(DRoutesName.navigationMenuRoute);
                      break;
                    case 2:
                      // context.pushNamed(DRoutesName.customerAdsRoute);
                      break;
                    case 3:
                      context.pushNamed(DRoutesName.navigationMenuRoute);
                      break;
                    case 4:
                      context.pushNamed(DRoutesName.myNoteBookRoute);
                      break;
                    case 5:
                      context.pushNamed(DRoutesName.medicalServiceRoute);
                      break;
                    case 6:
                      context.pushNamed(DRoutesName.expireProductRoute);
                      break;
                    case 7:
                      context.pushNamed(DRoutesName.navigationMenuRoute);
                      break;
                    case 8:
                      openWhatsAppChat();
                      break;
                    case 9:
                      context.pushNamed(DRoutesName.navigationMenuRoute);
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
                          statements: S.current.myOrderSpeak,
                          locale: S.current.localeee);
                      break;
                    case 4:
                      speak(
                          statements: S.current.sendNotebook,
                          locale: S.current.localeee);
                      break;
                    case 5:
                      speak(
                          statements: S.current.medicalServices,
                          locale: S.current.localeee);
                      break;
                    case 6:
                      speak(
                          statements: S.current.expiredProducts,
                          locale: S.current.localeee);
                      break;
                    case 7:
                      speak(
                          statements: S.current.favoriteItems,
                          locale: S.current.localeee);
                      break;
                    case 8:
                      speak(
                          statements: S.current.speakToUs,
                          locale: S.current.localeee);
                      break;
                    case 9:
                      speak(
                          statements: S.current.returnOrder,
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
                        text: DConstants.textOfMenu[index],
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
