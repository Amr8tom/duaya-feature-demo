import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/common/widgets/custom_container/custom_container.dart';
import 'package:duaya_app/features/settings/presentation/controller/translation_cubit.dart';
import 'package:duaya_app/features/settings/presentation/country/widgets/custom_bottom_sheet_country/custom_bottom_sheet_country.dart';
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
import 'package:flutter_tts/flutter_tts.dart';
import 'package:lottie/lottie.dart';

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
    final FlutterTts flutterTts = FlutterTts();
    Future<void> speak() async {
      await flutterTts.setLanguage('ar');
      await flutterTts.setPitch(1.0);
      await flutterTts.setSpeechRate(0.3);
      await flutterTts.speak(
          "تنبيه عليك سلفة بمقدار   ${settingController.profileModel.delayBalance!} ");
    }

    return BlocConsumer<SettinglationCubit, TranslationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        state is fetchProfileDataSuccess ? speak() : () {};
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

                        /// Container Credit Limit
                        Text(settingController.profileModel.message!,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    fontSize: 10.sp, color: ColorRes.black)),
                        settingController.profileModel.verificationStatus == 0
                            ? Text(
                                S.current.verification_status,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(color: ColorRes.error2),
                              )
                            : CustomContainer(
                                titleContainer1: S.current.avaiableToLoan,
                                titleContainer2: S.current.moneyYouLoan,
                                number1:
                                    "${settingController.profileModel.minAmount! - settingController.profileModel.delayBalance!}  ${S.current.pound}",
                                number2:
                                    "${settingController.profileModel.delayBalance}  ${S.current.pound}"),

                        /// Make Size
                        SizedBox(height: AppSizes.defaultSpace),

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
                              itemCount: 2),
                        ),

                        /// Make Size
                        SizedBox(height: AppSizes.spaceBtwItems),
                        Text(S.current.more,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontSize: 18.sp, color: ColorRes.error2)),

                        /// Make Size
                        SizedBox(height: AppSizes.spaceBtwItems),

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
                                      iconData: DConstants.iconsSetting[3],
                                      titleOfComponent:
                                          DConstants.titleSetting[3],
                                      description: DConstants.desSetting[3]),
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
