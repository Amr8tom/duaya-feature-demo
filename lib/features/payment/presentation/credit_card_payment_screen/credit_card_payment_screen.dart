import 'package:dio/dio.dart';
import 'package:duaya_app/common/custom_ui.dart';
import 'package:duaya_app/common/webViewPage.dart';
import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/payment/presentation/controller/payment_cubit.dart';
import 'package:duaya_app/features/payment/presentation/widgets/credit_card/custom_credit_card_Body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/constants/colors.dart';

class CreditCardPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final paymentController = context.read<PaymentCubit>();
    paymentController.changePaymentMethod(paymentMethodID: 2, context: context);
    paymentController.Pay();
    return Builder(builder: (context) {
      return Scaffold(
        appBar: DAppBar(
          showBackArrow: true,
          centerTitle: true,
          title: Text(
            S.current.creditCard,
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
    });
  }
}
