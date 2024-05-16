import 'package:duaya_app/features/menu/presentation/widget/custom_container_menu/custom_container_menu.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/constants/constants.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      padding:  EdgeInsets.symmetric(horizontal: AppSizes.spaceBtwItems, vertical: AppSizes.defaultSpace),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: AppSizes.imageSize,crossAxisSpacing: AppSizes.padding * 1, childAspectRatio: 5/3.5),
      shrinkWrap: true,
      itemCount: DConstants.iconOfMenu.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: (){
              index == 0 ? context.pushNamed(DRoutesName.walletRoute):
              index == 1 ? context.pushNamed(DRoutesName.myAdsRoute):
              index == 2 ? context.pushNamed(DRoutesName.customerAdsRoute):
              index == 3 ? context.pushNamed(DRoutesName.myOrderRoute):
              index == 4 ? context.pushNamed(DRoutesName.myNoteBookRoute):
              index == 5 ? context.pushNamed(DRoutesName.medicalServiceRoute):
              index == 6 ? context.pushNamed(DRoutesName.expireProductRoute):
              index == 7 ? context.pushNamed(DRoutesName.favoriteRoute):
              index == 9 ? context.pushNamed(DRoutesName.returnRequestRoute):
              Container();
            },
            child: CustomContainerMenu(text: DConstants.textOfMenu[index], iconData: DConstants.iconOfMenu[index]));
      },
    );
  }
}
