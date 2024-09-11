import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../routing/routes_name.dart';
import '../../widgets/methodCard.dart';

class BankInstallmentsScreen extends StatelessWidget {
  const BankInstallmentsScreen({super.key});

  void navigateTo6months(BuildContext context) {
    context.pushNamed(DRoutesName.paymentInInstallments6MonthsRoute);
  }

  void navigateTo12months(BuildContext context) {
    context.pushNamed(DRoutesName.paymentInInstallments12MonthsRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        showBackArrow: true,
        centerTitle: true,
        title: Text(
          S.current.installmentsServices,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildPaymentMethodCard(context, S.current.installments6mon,
                Icons.schedule, () => navigateTo6months(context)),
            buildPaymentMethodCard(context, S.current.installments12mon,
                Icons.schedule, () => navigateTo12months(context)),
          ],
        ),
      ),
    );
  }
}
