import 'package:duaya_app/common/common_snak_bar_widget.dart';
import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import '../../../../generated/l10n.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';

class WalletPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        showBackArrow: true,
        centerTitle: true,
        title: Text(
          S.current.walletByPayment,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              // elevation: 5,
              color: ColorRes.whiteLevel.withOpacity(0.3),
              child: Lottie.asset(
                AssetRes.wallet,
              )),
          Spacer(),
          Text(
            S.current.walletCacheDes,
            style: Theme.of(context).textTheme.headlineMedium!,
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              commonToast("جاري تحديث اليبانات حاليا");
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
