import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../utils/constants/colors.dart';

class CustomUI {
  static loader({required BuildContext context}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
            child: Lottie.asset(AssetRes.loadingSliders, width: 100.w));
      },
    );
  }

  static Widget simpleLoader() {
    return Center(child: Lottie.asset(AssetRes.loadingSliders, width: 100.w));
  }
}
