import 'package:cached_network_image/cached_network_image.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/exports.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    this.borderRadius,
    this.link,
    this.width,
    this.height,
    this.lottieFileOnError,
    this.fit,
  });
  final double? borderRadius;
  final String? link;
  final String? lottieFileOnError;
  final double? width;
  final double? height;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 50.r),
      child: link != null
          ? CachedNetworkImage(
              errorWidget: (context, url, error) {
                return Lottie.asset(lottieFileOnError ?? AssetRes.emptyProduct);
                // return SvgPicture.asset(AppAssets.emptyImage);
              },
              imageUrl: link!,
              width: width,
              height: height ?? 30,
              fit: fit,
            )
          : Container(
              width: width,
              height: height ?? 30,
              decoration: const BoxDecoration(
                color: ColorRes.primary,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(8),
            ),
    );
  }
}
