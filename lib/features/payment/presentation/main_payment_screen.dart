import 'package:duaya_app/features/payment/presentation/widgets/methodCard.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../generated/l10n.dart';

class PaymentScreen extends StatelessWidget {
  void navigateToCashOnDelivery(BuildContext context) {
    context.pushNamed(DRoutesName.CashOnDeliveryRoute);
  }

  void navigateToCreditCardPayment(BuildContext context) {
    context.pushNamed(DRoutesName.CreditCardPaymentRoute);
  }

  void navigateToDelayedCash(BuildContext context) {
    context.pushNamed(DRoutesName.DelayedCashRoute);
  }

  void navigateToWalletPaymen(BuildContext context) {
    context.pushNamed(DRoutesName.walletPaymentRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.current.choosePaymentMethod,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: ColorRes.appBarColor, fontSize: 30.sp),
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
            buildPaymentMethodCard(context, S.current.creditCard,
                Icons.credit_card, () => navigateToCreditCardPayment(context)),
            buildPaymentMethodCard(context, S.current.delayedCash,
                Icons.schedule, () => navigateToDelayedCash(context)),
          ],
        ),
      ),
    );
  }
}
