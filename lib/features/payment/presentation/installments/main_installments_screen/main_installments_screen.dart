import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../routing/routes_name.dart';
import '../../widgets/methodCard.dart';

class MainInstallmentsScreen extends StatelessWidget {
  const MainInstallmentsScreen({super.key});

  void navigateToBankIstallments(BuildContext context) {
    context.pushNamed(DRoutesName.paymentInInstallmentsBank);
  }

  void navigateToValu(BuildContext context) {
    context.pushNamed(DRoutesName.paymentInInstallmentsValu);
  }

  void navigateToSouhoola(BuildContext context) {
    context.pushNamed(DRoutesName.paymentInInstallmentsSouhoola);
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
            buildPaymentMethodCard(context, S.current.installmentsbank,
                Icons.schedule, () => navigateToBankIstallments(context)),
            buildPaymentMethodCard(context, S.current.installmentWithValu,
                Icons.schedule, () => navigateToValu(context)),
            buildPaymentMethodCard(context, S.current.installmentWithSouhoola,
                Icons.schedule, () => navigateToSouhoola(context)),
          ],
        ),
      ),
    );
  }
}
