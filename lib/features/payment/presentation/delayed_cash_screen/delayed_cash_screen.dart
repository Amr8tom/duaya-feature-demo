import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import '../../../../common/common_snak_bar_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';

class DelayedCashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        showBackArrow: true,
        centerTitle: true,
        title: Text(
          S.current.delayedCash,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              // elevation: 5,
              color: ColorRes.lightGreen.withOpacity(0.3),
              child: Lottie.asset(
                AssetRes.delayedCash,
              )),
          Spacer(),
          Text(
            S.current.delayedCashDes,
            style: Theme.of(context).textTheme.headlineMedium!,
          ),
          Text(
            S.current.delayedCashScreenDesTime,
            style: Theme.of(context).textTheme.headlineMedium!,
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              commonToast("غير ممكن حاليا");
              // cartController.checkOut(
              //     paymentType: "wallet",
              //     userID: cartController.Items![0].userId.toString(),
              //     context: context);
            },
            child: Center(
              child: Text(
                S.current.confirmPayment,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: ColorRes.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
