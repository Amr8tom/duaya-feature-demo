import 'package:duaya_app/common/widgets/cached_image/cached_image.dart';
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
          imageWidget = CachedImage(
            link: brandImage,
            width: 60,
            height: 180,
          );
          if (brandImage == AssetRes.emptyProductFromServer) {
            imageWidget =
                Lottie.asset(AssetRes.emptyProduct, fit: BoxFit.cover);
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
                        color: ColorRes.greenBlueLight,
                        border:
                            Border.all(color: ColorRes.greenBlue, width: 1.w)),
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
                          color: ColorRes.greenBlue,
                        ),
                        width: double.infinity,
                        padding: EdgeInsets.only(bottom: 6.sp),
                        child: Center(
                          child: Text(
                            brandTitle,
                            overflow: TextOverflow.fade,
                            maxLines: 2,
                            style: TextStyle(
                                color: ColorRes.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp),
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
