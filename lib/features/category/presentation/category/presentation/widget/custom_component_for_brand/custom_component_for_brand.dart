import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:duaya_app/utils/connection/checkImageNetwork.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../utils/constants/image_strings.dart';

class CustomComponentForBrand extends StatelessWidget {
  CustomComponentForBrand(
      {Key? key,
      required this.brandImage,
      required this.brandTitle,
      this.onTap})
      : super(key: key);
  String brandImage, brandTitle;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checkImageNetwork.checkImageStatus(NetworkImageURL: brandImage),
        builder: (context, snapshot) {
          Widget imageWidget;
          if (snapshot.connectionState == ConnectionState.waiting) {
            imageWidget = Center(
              child: Lottie.asset(AssetRes.circleLoading),
            );
          } else if (snapshot.hasError || !snapshot.data!) {
            imageWidget = Lottie.asset(AssetRes.emptyProduct);
          } else {
            if (brandImage == AssetRes.emptyProductFromServer) {
              imageWidget =
                  Lottie.asset(AssetRes.emptyProduct, fit: BoxFit.cover);
            } else {
              imageWidget = Image.network(brandImage);
            }
          }
          return InkWell(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.all(10.sp),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: ColorRes.primary.withOpacity(0.5),
                            width: 2.w)),
                    child: imageWidget,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: ColorRes.primary.withOpacity(0.8),
                        ),
                        width: double.infinity,
                        padding: EdgeInsets.only(bottom: 6.sp),
                        child: Center(
                          child: Text(
                            brandTitle,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
