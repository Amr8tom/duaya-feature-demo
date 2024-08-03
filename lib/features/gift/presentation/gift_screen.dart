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
              showBackGroundColor: true,
              centerTitle: true,
              showBackArrow: true,
              arrowBackColor: true,

              /// Flash Title
              title: Text('${S.current.cashBack}'),
            ),
            body: state is GiftILoadingData
                ? Center(
                    child: Lottie.asset(AssetRes.loadingSliders, width: 200.w))
                : Center(
                    child: Padding(
                      padding: EdgeInsets.all(AppSizes.padding / 2),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50.h,
                          ),
                          Container(
                            height: 150.h,
                            width: 327.w,
                            padding: EdgeInsets.symmetric(
                                vertical: AppSizes.padding),
                            decoration: BoxDecoration(
                              color: ColorRes.greyGreen2,
                              // border:B ,
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
                                        .copyWith(
                                            fontSize: 24.sp,
                                            fontWeight: FontWeight.w700),
                                    overflow: TextOverflow.ellipsis),
                                SizedBox(height: AppSizes.defaultSpace / 2),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '${S.current.contvertTo}${giftController.money} ${S.current.pound}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium!
                                            .copyWith(
                                                color: ColorRes.lightGreen),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          CustomButtonWithIcon2(
                              textButton: S.current.sendToWallet,
                              width: 191.w,
                              height: 46.h,
                              color: ColorRes.greenBlue,
                              onTap: () {},
                              borderColor: Colors.transparent,
                              textButtonColor: ColorRes.white,
                              isAddToCart: false),
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
