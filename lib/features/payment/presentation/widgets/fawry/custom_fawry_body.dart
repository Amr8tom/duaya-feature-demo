import 'package:duaya_app/features/payment/presentation/controller/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../common/common_snak_bar_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';

class CustomFawryBody extends StatelessWidget {
  const CustomFawryBody({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentController = context.read<PaymentCubit>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            // elevation: 5,
            color: ColorRes.lightGreen.withOpacity(0.3),
            child: Lottie.asset(
              AssetRes.fawry,
            )),
        Spacer(),
        Text(
          S.current.fawryDes,
          style: Theme.of(context).textTheme.headlineMedium!,
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () async {
            await paymentController.Pay();
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
    );
  }
}
