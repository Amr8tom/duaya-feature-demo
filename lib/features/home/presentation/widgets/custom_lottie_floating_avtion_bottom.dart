import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../generated/l10n.dart';
import '../../../../routing/routes_name.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';

class CustomLottieFloatingAvtionBottom extends StatelessWidget {
  const CustomLottieFloatingAvtionBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        context.pushNamed(DRoutesName.searchRoute);
      },
      child: CircleAvatar(
        backgroundColor: ColorRes.greenBlue,
        radius: 35,
        child: SizedBox(
          width: 70,
          height: kToolbarHeight * 1.5,
          child: Stack(
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    Text(
                      S.current.searchTitle,
                      style: TextStyle(fontSize: 16, color: ColorRes.white),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Spacer(),
                  SizedBox(
                    width: 50,
                    child: Transform.scale(
                        scale: 2.1, child: Lottie.asset(AssetRes.searchICon)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
