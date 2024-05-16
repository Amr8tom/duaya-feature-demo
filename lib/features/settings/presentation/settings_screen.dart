import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/common/widgets/custom_container/custom_container.dart';
import 'package:duaya_app/features/settings/presentation/country/widgets/custom_bottom_sheet_country/custom_bottom_sheet_country.dart';
import 'package:duaya_app/features/settings/presentation/language/widgets/custom_bottom_sheet_language.dart';
import 'package:duaya_app/features/settings/widgets/custom_container_of_data_user/custom_container_of_data_user.dart';
import 'package:duaya_app/features/settings/widgets/custom_setting_component/custom_setting_component.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/constants.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../authentication/presentation/controller/auth_controller_cubit.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final authController = context.read<AuthControllerCubit>();
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: DAppBar(
        title: Text(S.current.settings),
        centerTitle: true,
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.spaceBtwItems),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Container Data User
              const CustomContainerOfDataUser(),

              /// Make Size
              SizedBox(height: AppSizes.spaceBtwItems / 1.2),

              /// Container Credit Limit
              CustomContainer(
                  titleContainer: S.current.yourCreditLimit,
                  number: "237.00 EGP"),

              /// Make Size
              SizedBox(height: AppSizes.defaultSpace),

              /// Component Setting
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.spaceBtwItems / 1.5,
                    vertical: AppSizes.spaceBtwItems),
                decoration: BoxDecoration(
                  color: ColorRes.white,
                  borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
                  boxShadow: [
                    BoxShadow(
                      color: ColorRes.black.withOpacity(.3),
                      blurRadius: 2,
                      spreadRadius: 1,
                      offset: Offset(1.w, 1.h),
                    ),
                  ],
                ),
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            index == 0
                                ? context
                                    .pushNamed(DRoutesName.profileInfoRoute)
                                : index == 1
                                    ? context.pushNamed(
                                        DRoutesName.pharmacyInfoRoute)
                                    : index == 2
                                        ? showBottomSheetLanguage()
                                        : index == 3
                                            ? showBottomSheetCountry()
                                            : Container();
                          },
                          child: CustomSettingComponent(
                              iconData: DConstants.iconsSetting[index],
                              titleOfComponent: DConstants.titleSetting[index],
                              description: DConstants.desSetting[index]));
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: AppSizes.spaceBtwItems);
                    },
                    itemCount: 4),
              ),

              /// Make Size
              SizedBox(height: AppSizes.spaceBtwItems),
              Text("More",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 18.sp)),

              /// Make Size
              SizedBox(height: AppSizes.spaceBtwItems),

              /// Other Component Setting
              Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.spaceBtwItems / 1.5,
                      vertical: AppSizes.spaceBtwItems),
                  decoration: BoxDecoration(
                    color: ColorRes.white,
                    borderRadius:
                        BorderRadius.circular(AppSizes.borderRadiusLg),
                    boxShadow: [
                      BoxShadow(
                        color: ColorRes.black.withOpacity(.3),
                        blurRadius: 2,
                        spreadRadius: 1,
                        offset: Offset(1.w, 1.h),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      CustomSettingComponent(
                          iconData: DConstants.iconsSetting[4],
                          titleOfComponent: DConstants.titleSetting[4],
                          description: DConstants.desSetting[4]),
                      SizedBox(height: AppSizes.spaceBtwItems),
                      CustomSettingComponent(
                          iconData: DConstants.iconsSetting[5],
                          titleOfComponent: DConstants.titleSetting[5],
                          description: DConstants.desSetting[5]),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void showBottomSheetLanguage() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSizes.productImageRadius),
                topRight: Radius.circular(AppSizes.productImageRadius))),
        showDragHandle: true,
        isScrollControlled: false,
        context: context,
        builder: (context) {
          return const CustomBottomSheetLanguage();
        });
  }

  void showBottomSheetCountry() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSizes.productImageRadius),
                topRight: Radius.circular(AppSizes.productImageRadius))),
        showDragHandle: true,
        isScrollControlled: false,
        context: context,
        builder: (context) {
          return const CustomBottomSheetCountry();
        });
  }
}
