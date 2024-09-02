import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../controller/payment_cubit.dart';

class MobileWalletBodyInit extends StatelessWidget {
  const MobileWalletBodyInit({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentController = context.read<PaymentCubit>();
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                color: ColorRes.lightGreen.withOpacity(0.3),
                child: Lottie.asset(
                  AssetRes.mobileWallet,
                )),
            const SizedBox(
              height: kToolbarHeight,
            ),
            Text(
              S.current.enterMobileWallet,
              style: Theme.of(context).textTheme.headlineMedium!,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(),
                controller: paymentController.mobileController,
              ),
            ),
            const SizedBox(
              height: kToolbarHeight,
            ),
            ElevatedButton(
              onPressed: () async {
                if (paymentController.mobileController.text == null ||
                    paymentController.mobileController.text == '') {
                  print("Im here =================");
                  print("Im here =================");
                  print("Im here =================");
                } else {
                  print("Im here =================");
                  print(paymentController.mobileController.text);
                  print(paymentController.mobileController.text);
                  print(paymentController.mobileController.text);
                  print(paymentController.mobileController.text);
                  print(paymentController.mobileController.text);
                  print(paymentController.mobileController.text);
                  print(paymentController.mobileController.text);
                  paymentController.changePaymentMethod(
                      paymentMethodID: 4, context: context);
                  await paymentController.Pay();
                }
              },
              child: Center(
                child: Text(
                  S.current.getPaymentCode,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: ColorRes.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
