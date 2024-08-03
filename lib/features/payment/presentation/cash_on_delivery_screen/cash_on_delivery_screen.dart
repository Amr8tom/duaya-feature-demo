import 'package:duaya_app/features/cart/presentation/widgets/controller/cart_cubit.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../generated/l10n.dart';

class CashOnDeliveryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartController = context.read<CartCubit>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorRes.lightGreen,
        title: Text(
          S.current.cashOnDelivery,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: ColorRes.white, fontSize: 25.sp),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Container(
              // elevation: 5,
              color: ColorRes.whiteLevel.withOpacity(0.3),
              child: Lottie.asset(
                AssetRes.cashImage,
              )),
          Spacer(),
          Text(
            S.current.cashOnDeliverydes,
            style: Theme.of(context).textTheme.headlineMedium!,
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              print(cartController.Items![0].userId.toString());
              cartController.checkOut(
                  userID: cartController.Items![0].userId.toString(),
                  context: context);
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
