import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/payment/presentation/widgets/installments_6_months/custom_installments_6_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/custom_ui.dart';
import '../../../../../common/webViewPage.dart';
import '../../../../../generated/l10n.dart';
import '../../controller/payment_cubit.dart';

class PaymentInInstallments6Months extends StatelessWidget {
  const PaymentInInstallments6Months({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentController = context.read<PaymentCubit>();
    paymentController.changePaymentMethod(paymentMethodID: 5, context: context);
    paymentController.Pay();
    return Scaffold(
      appBar: DAppBar(
        showBackArrow: true,
        centerTitle: true,
        title: Text(
          S.current.installments6mon,
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
            return const CustomInstallments6Body();
          }
        },
      ),
    );
  }
}
