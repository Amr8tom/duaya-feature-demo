import 'package:duaya_app/common/common_snak_bar_widget.dart';
import 'package:duaya_app/features/cart/presentation/widgets/controller/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../generated/l10n.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';

class WalletPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartController = context.read<CartCubit>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorRes.lightGreen,
        title: Text(
          S.current.walletByPayment,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: ColorRes.white, fontSize: 25.sp),
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
