import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/exports.dart';

class DSpacingStyle {
  static final EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: AppSizes.appBarHeight,
    bottom: AppSizes.defaultSpace,
    right: AppSizes.defaultSpace,
    left: AppSizes.defaultSpace,
  );
}
