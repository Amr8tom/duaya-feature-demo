import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/services/presentation/wallet/presentation/widgets/Custom_recharge_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/dynamic/sizer.dart';
import '../../../../../generated/l10n.dart';

class RechargeWalletScreen extends StatelessWidget {
  const RechargeWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        showBackArrow: true,
        title: Text(
          S.current.rechangreWallet,
          style: TextStyle(fontSize: 18.sp),
        ),
      ),
      body: Column(
        children: [
          /// make size
          const Sizer(),

          ///  recharge form
          const CustomRechargeForm(),
        ],
      ),
    );
  }
}
