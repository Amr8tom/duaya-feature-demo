import 'package:duaya_app/features/settings/presentation/language/widgets/custom_component_language.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: ColorRes.greenBlue,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700)),
          SizedBox(height: AppSizes.spaceBtwItems),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomComponentLanguage(
                  borderColor:
                      isTagle == false ? ColorRes.primary : ColorRes.greenBlue,
                  language: S.current.arabic,
                  onTap: () {
                    setState(() {
                      isTagle = true;
                      transalationController.setCurrentLangeuage(
                          language: "ar");
                    });
                  }),
              SizedBox(
                width: 40.w,
              ),
              CustomComponentLanguage(
                  borderColor:
                      isTagle == false ? ColorRes.primary : ColorRes.greenBlue,
                  language: "English",
                  onTap: () {
                    setState(() {
                      isTagle = false;
                      transalationController.setCurrentLangeuage(
                          language: "en");
                    });
                  }),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppSizes.spaceBtwItems),
                child: Text(S.current.saveChanges,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: ColorRes.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700)),
              ))
        ],
      ),
    );
  }
}
