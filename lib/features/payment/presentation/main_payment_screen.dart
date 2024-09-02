import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/payment/presentation/widgets/methodCard.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';

class PaymentScreen extends StatelessWidget {
  void navigateToCashOnDelivery(BuildContext context) {
    context.pushNamed(DRoutesName.CashOnDeliveryRoute);
  }

  void navigateToDelayedCash(BuildContext context) {
    context.pushNamed(DRoutesName.DelayedCashRoute);
  }

  void navigateToWalletPaymen(BuildContext context) {
    context.pushNamed(DRoutesName.walletPaymentRoute);
  }

  void navigateToRemotePayment(BuildContext context) {
    context.pushNamed(DRoutesName.remotePaymentRoute);
  }

  void navigateToInstallemnts(BuildContext context) {
    context.pushNamed(DRoutesName.paymentInInstallmentsMain);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        showBackArrow: true,
        centerTitle: true,
        title: Text(
          S.current.choosePaymentMethod,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildPaymentMethodCard(context, S.current.cashOnDelivery,
                Icons.delivery_dining, () => navigateToCashOnDelivery(context)),
            buildPaymentMethodCard(context, S.current.walletByPayment,
                Icons.wallet, () => navigateToWalletPaymen(context)),
            buildPaymentMethodCard(context, S.current.delayedCash,
                Icons.schedule, () => navigateToDelayedCash(context)),
            buildPaymentMethodCard(context, S.current.remotePayment,
                Icons.schedule, () => navigateToRemotePayment(context)),
            buildPaymentMethodCard(context, S.current.installmentsServices,
                Icons.schedule, () => navigateToInstallemnts(context)),
          ],
        ),
      ),
    );
  }
}
