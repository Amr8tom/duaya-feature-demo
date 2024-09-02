import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';
import '../../../../routing/routes_name.dart';
import '../../../../utils/constants/colors.dart';
import '../widgets/methodCard.dart';

class RemotePaymentScreen extends StatelessWidget {
  void navigateToFawry(BuildContext context) {
    context.pushNamed(DRoutesName.fawaterkRoute);
  }

  void navigateToCreditCardPayment(BuildContext context) {
    context.pushNamed(DRoutesName.CreditCardPaymentRoute);
  }

  void navigateToMobileWallet(BuildContext context) {
    context.pushNamed(DRoutesName.mobileWalletRoute);
  }

  void navigateToOtherTypes(BuildContext context) {
    context.pushNamed(DRoutesName.OtherTypesRoute);
  }

  const RemotePaymentScreen({super.key});

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
            buildPaymentMethodCard(context, S.current.fawry,
                Icons.filter_b_and_w, () => navigateToFawry(context)),
            buildPaymentMethodCard(context, S.current.creditCard,
                Icons.credit_card, () => navigateToCreditCardPayment(context)),
            buildPaymentMethodCard(context, S.current.mobileWallet,
                Icons.schedule, () => navigateToMobileWallet(context)),
            buildPaymentMethodCard(context, S.current.OtherTypes,
                Icons.schedule, () => navigateToOtherTypes(context)),
          ],
        ),
      ),
    );
  }
}
