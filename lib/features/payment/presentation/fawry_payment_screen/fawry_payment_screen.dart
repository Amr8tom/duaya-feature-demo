import 'package:duaya_app/common/custom_ui.dart';
import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/payment/presentation/controller/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../generated/l10n.dart';
import '../widgets/fawry/custom_fawry_body.dart';
import '../widgets/fawry/custom_fawry_body_with_code.dart';

class FawryPaymentScreen extends StatelessWidget {
  const FawryPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context
        .read<PaymentCubit>()
        .changePaymentMethod(paymentMethodID: 3, context: context);
    context.read<PaymentCubit>().Pay();

    return Scaffold(
      appBar: DAppBar(
        showBackArrow: true,
        centerTitle: true,
        title: Text(
          S.current.fawry,
        ),
      ),
      body: BlocBuilder<PaymentCubit, PaymentState>(
        builder: (context, state) {
          if (state is PaymentLoading) {
            return CustomUI.simpleLoader();
          } else if (state is PaymentFailure) {
            return Center(child: CustomUI.tryLater());
          } else if (state is PaymentSucessed) {
            return CustomFawryBodyWithCode(
              fawryCode:
                  state.invoiceModel.data?.paymentData?.fawryCode?.toString(),
            );
          } else {
            return const CustomFawryBody();
          }
        },
      ),
    );
  }
}
