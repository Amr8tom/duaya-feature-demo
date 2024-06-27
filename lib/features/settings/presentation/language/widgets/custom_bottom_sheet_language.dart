import 'package:duaya_app/features/settings/presentation/language/widgets/custom_component_language.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/translation_cubit.dart';

class CustomBottomSheetLanguage extends StatefulWidget {
  const CustomBottomSheetLanguage({Key? key}) : super(key: key);

  @override
  State<CustomBottomSheetLanguage> createState() =>
      _CustomBottomSheetLanguageState();
}

class _CustomBottomSheetLanguageState extends State<CustomBottomSheetLanguage> {
  @override
  Widget build(BuildContext context) {
    final transalationController = context.read<SettinglationCubit>();
    double height = MediaQuery.of(context).size.height;
    bool isTagle = false;
    return Container(
      height: height / 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(S.current.selectLanguage,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: ColorRes.primary)),
          SizedBox(height: AppSizes.spaceBtwItems),
          CustomComponentLanguage(
              borderColor: isTagle == true ? ColorRes.error2 : ColorRes.primary,
              language: "Arabic",
              onTap: () {
                setState(() {
                  isTagle = true;
                  transalationController.setCurrentLangeuage(language: "ar");
                });
              }),
          CustomComponentLanguage(
              borderColor:
                  isTagle == false ? ColorRes.error2 : ColorRes.primary,
              language: "English",
              onTap: () {
                setState(() {
                  isTagle = false;
                  transalationController.setCurrentLangeuage(language: "en");
                });
              }),
        ],
      ),
    );
  }
}
