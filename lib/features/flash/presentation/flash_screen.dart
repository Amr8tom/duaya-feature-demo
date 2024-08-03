import 'package:duaya_app/features/category/presentation/category/presentation/widget/flash_today_deals_body_girdview.dart';
import 'package:duaya_app/features/flash/presentation/widgets/flash_deal_graidview.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../generated/l10n.dart';
import 'widgets/custom_time_left_in_flash_sale.dart';

class FlashScreen extends StatefulWidget {
  const FlashScreen({super.key});

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController1;

  @override
  void initState() {
    _tabController1 = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController1!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          indicatorColor: ColorRes.greenBlue,
          controller: _tabController1,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black,
          onTap: (_) {
            print("sdsdsdsdsdsd");
          },
          tabs: [
            Tab(
                child: Container(
              width: 140.sp,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: ColorRes.greenBlueLight,
                  borderRadius: BorderRadius.circular(20)),
              child: Text(S.current.flashSale,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: ColorRes.greenBlue)),
            )),
            Tab(
                child: Container(
              width: 140.sp,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: ColorRes.greenBlueLight,
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                S.current.flashTodaySale,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: ColorRes.greenBlue),
              ),
            )),
          ],
        ),

        /// Products
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(AppSizes.spaceBtwItems),
          child: TabBarView(controller: _tabController1, children: [
            SingleChildScrollView(
                child: Column(
              children: [
                CustomTimeLeftInFlashSale(),
                SizedBox(height: AppSizes.spaceBtwItems * 3),
                FlashGridView(),
              ],
            )),
            SingleChildScrollView(child: FlashTodayProductGridView())
          ]),
        )),
      ],
    );
  }
}
