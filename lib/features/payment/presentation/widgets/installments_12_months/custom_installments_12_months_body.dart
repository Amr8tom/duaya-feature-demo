import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../controller/payment_cubit.dart';

class CustomInstallments12MonthsBody extends StatelessWidget {
  const CustomInstallments12MonthsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentController = context.read<PaymentCubit>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            color: ColorRes.whiteLevel.withOpacity(0.3),
            child: Lottie.asset(
              AssetRes.creditCard,
            )),
        Spacer(),
        Text(
          S.current.installments12mon,
          style: Theme.of(context).textTheme.headlineMedium!,
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () async {
            await paymentController.Pay();
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
    );
    ;
  }
}
