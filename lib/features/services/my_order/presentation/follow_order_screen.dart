import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/common/widgets/dynamic/sizer.dart';
import 'package:duaya_app/features/services/my_order/presentation/widgets/custom_back_to_home_buttom.dart';
import 'package:duaya_app/features/services/my_order/presentation/widgets/custom_follow_order_steper.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../generated/l10n.dart';

class FollowOrderScreen extends StatelessWidget {
  const FollowOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        showBackArrow: true,
        centerTitle: true,
        title: Text(S.current.followOeder),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            /// order status stepes
            const CustomFollowOrderSteper(),

            /// make size
            SizedBox(
              height: 120.h,
            ),

            /// back to home button
            const CustomBackToHomeButtom(),
          ],
        ),
      ),
    );
  }
}
