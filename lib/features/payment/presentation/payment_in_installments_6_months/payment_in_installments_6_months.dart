import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/custom_ui.dart';
import '../../../../common/webViewPage.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/constants/colors.dart';
import '../controller/payment_cubit.dart';
import '../widgets/credit_card/custom_credit_card_Body.dart';

class PaymentInInstallments extends StatelessWidget {
  const PaymentInInstallments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorRes.lightGreen,
        title: Text(
          S.current.creditCard,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: ColorRes.white, fontSize: 25.sp),
        ),
      ),
      body: BlocBuilder<PaymentCubit, PaymentState>(
        builder: (context, state) {
          if (state is PaymentSucessed) {
            print(state.invoiceModel!.data!.paymentData!.redirectTo);
            print(state.invoiceModel!.data!.invoiceKey);
            print(state.invoiceModel!.data!.paymentData!.redirectTo);
            return WebViewPage(
                url: state.invoiceModel!.data!.paymentData!.redirectTo
                    .toString());
          } else if (state is PaymentFailure) {
            return Center(child: CustomUI.tryLater());
          } else if (state is PaymentLoading) {
            return CustomUI.simpleLoader();
          } else {
            return const CustomCreditCardBody();
          }
        },
      ),
    );
  }
}
