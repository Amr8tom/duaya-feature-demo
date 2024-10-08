import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/payment/presentation/controller/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/custom_ui.dart';
import '../../../../../common/webViewPage.dart';
import '../../../../../generated/l10n.dart';
import '../../widgets/installments_valu/custom_installments_valu_body.dart';

class ValuInstallments extends StatelessWidget {
  const ValuInstallments({super.key});
  @override
  Widget build(BuildContext context) {
    final paymentController = context.read<PaymentCubit>();
    paymentController.changePaymentMethod(
        paymentMethodID: 11, context: context);
    paymentController.Pay();
    return Scaffold(
      appBar: DAppBar(
        showBackArrow: true,
        centerTitle: true,
        title: Text(
          S.current.valu,
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
            return const CustomInstallmentsValuBody();
          }
        },
      ),
    );
  }
}
