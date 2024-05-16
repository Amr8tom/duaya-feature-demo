import 'package:duaya_app/common/managers/language/language_cubit.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/exports.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/theme/custom_themes/appbar_theme.dart';
import 'package:duaya_app/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:duaya_app/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:duaya_app/utils/theme/custom_themes/chip_theme.dart';
import 'package:duaya_app/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:duaya_app/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:duaya_app/utils/theme/custom_themes/text_field_theme.dart';
import 'package:duaya_app/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DAppTheme {
  DAppTheme._();

  static ThemeData lightTheme(BuildContext context) {
    String fontFamily =
    // BlocProvider.of<LanguageCubit>(context).getSavedLanguage == true
    //     ?
    'Poppins';
        // : 'Cairo';

    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      textTheme: DTextTheme.lightTextTheme,
      chipTheme: DChipTheme.lightChipTheme,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: DAppBarTheme.lightAppBarTheme,
      checkboxTheme: DCheckBoxTheme.lightCheckboxTheme,
      bottomSheetTheme: DBottomSheetTheme.lightBottomSheetTheme,
      elevatedButtonTheme: DElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: DOutlinedButtonTheme.lightOutlinedButtonTheme,
      inputDecorationTheme: DTextFormFieldTheme.lightInputDecorationTheme,
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    String fontFamily =
    // BlocProvider.of<LanguageCubit>(context).getSavedLanguage == true
    //     ?
    'Poppins';
        // : 'Cairo';

    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      textTheme: DTextTheme.darkTextTheme,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: DAppBarTheme.darkAppBarTheme,
      checkboxTheme: DCheckBoxTheme.darkCheckboxTheme,
      bottomSheetTheme: DBottomSheetTheme.darkBottomSheetTheme,
      elevatedButtonTheme: DElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: DOutlinedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: DTextFormFieldTheme.darkInputDecorationTheme,
    );
  }
}
