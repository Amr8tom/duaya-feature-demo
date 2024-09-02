import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/settings/presentation/controller/translation_cubit.dart';
import 'package:duaya_app/features/settings/presentation/language/widgets/custom_bottom_sheet_language.dart';
import 'package:duaya_app/features/settings/widgets/custom_container_of_data_user/custom_container_of_data_user.dart';
import 'package:duaya_app/features/settings/widgets/custom_setting_component/custom_setting_component.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/constants.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import 'controller/update_profile_cubit.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final settingController = context.read<SettinglationCubit>();
    context.read<UpdateProfileCubit>().fetchCountries();
    return BlocConsumer<SettinglationCubit, TranslationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        state is fetchProfileDataLoading
            ? settingController.fetchProfileData()
            : () {};
        return state is fetchProfileDataLoading
            ? Lottie.asset(AssetRes.loadingSliders)
            : Scaffold(
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

                        /// Component Setting
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
                          child: ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () {
                                      // index == 0
                                      //     ? context
                                      //         .pushNamed(DRoutesName.profileInfoRoute)
                                      //     :
                                      index == 0
                                          ? context.pushNamed(
                                              DRoutesName.profileInfoRoute)
                                          : index == 1
                                              ? showBottomSheetLanguage()
                                              : index == 2
                                                  ? context.pushNamed(
                                                      DRoutesName.favoriteRoute)
                                                  : index == 3
                                                      ? context.pushNamed(
                                                          DRoutesName
                                                              .myOrderRoute)
                                                      : index == 4
                                                          ? context.pushNamed(
                                                              DRoutesName
                                                                  .returnRequestRoute)
                                                          : Container();
                                    },
                                    child: CustomSettingComponent(
                                        iconData:
                                            DConstants.iconsSetting[index],
                                        titleOfComponent:
                                            DConstants.titleSetting[index],
                                        description:
                                            DConstants.desSetting[index]));
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(height: AppSizes.spaceBtwItems);
                              },
                              itemCount: 5),
                        ),

                        /// Make Size
                        SizedBox(height: AppSizes.spaceBtwItems * 3),

                        /// Other Component Setting
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppSizes.spaceBtwItems / 1.5,
                                vertical: AppSizes.spaceBtwItems),
                            decoration: BoxDecoration(
                              color: ColorRes.white,
                              borderRadius: BorderRadius.circular(
                                  AppSizes.borderRadiusLg),
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
                                InkWell(
                                  onTap: () {
                                    SettinglationCubit()
                                      ..logOut(context: context);
                                  },
                                  child: CustomSettingComponent(
                                      iconData: DConstants.iconsSetting[5],
                                      titleOfComponent:
                                          DConstants.titleSetting[5],
                                      description: DConstants.desSetting[5]),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              );
      },
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
}
