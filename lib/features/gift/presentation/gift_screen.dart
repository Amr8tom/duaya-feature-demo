import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/common/widgets/custom_button/custom_button_with_icon.dart';
import 'package:duaya_app/features/gift/presentation/controller/gift_cubit.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../generated/l10n.dart';
import '../../../utils/constants/image_strings.dart';

class GiftScreen extends StatelessWidget {
  const GiftScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => GiftCubit()..fetchGiftData(),
      child: BlocConsumer<GiftCubit, GiftState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final giftController = context.read<GiftCubit>();
          return Scaffold(
            appBar: DAppBar(
              bgColor: ColorRes.lightGreen,
              showBackGroundColor: true,
              centerTitle: true,
              showBackArrow: true,
              arrowBackColor: true,

              /// Flash Title
              title: Text('${S.current.cashBack}',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontSize: 30.sp, color: ColorRes.white)),
            ),
            body: state is GiftILoadingData
                ? Lottie.asset(AssetRes.animationLoading)
                : SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(AppSizes.padding / 2),
                      child: Column(
                        children: [
                          Card(
                            elevation: 5,
                            child: Container(
                              padding: EdgeInsets.all(AppSizes.padding),
                              decoration: BoxDecoration(
                                color: ColorRes.white,
                                borderRadius: BorderRadius.circular(
                                    AppSizes.borderRadiusLg),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                      '${S.current.youHave} ${giftController.GiftModel.minAmount}  ${S.current.points}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .copyWith(color: Colors.red),
                                      overflow: TextOverflow.ellipsis),
                                  SizedBox(height: AppSizes.defaultSpace / 2),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 7,
                                        child: Text('${S.current.contvertTo}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium!
                                                .copyWith(
                                                    color: ColorRes.lightGreen),
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                            '${giftController.money} ${S.current.pound}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium!
                                                .copyWith(color: Colors.red),
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: AppSizes.defaultSpace),
                                  // CustomButtonWithIcon2(
                                  //     textButton: 'Refused',
                                  //     width: width / 2.5,
                                  //     color: ColorRes.error2,
                                  //     onTap: () {},
                                  //     borderColor: Colors.transparent,
                                  //     textButtonColor: ColorRes.white,
                                  //     isAddToCart: false),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
