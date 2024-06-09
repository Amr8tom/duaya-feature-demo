import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../../generated/l10n.dart';

class PaymentScreen extends StatelessWidget {
  void navigateToCashOnDelivery(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CashOnDeliveryScreen()),
    );
  }

  void navigateToCreditCardPayment(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreditCardPaymentScreen()),
    );
  }

  void navigateToDelayedCash(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DelayedCashScreen()),
    );
  }

  Widget buildPaymentMethodCard(BuildContext context, String title,
      IconData icon, void Function() onPressed) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue, size: 40.0),
        title: Text(title,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        trailing: Icon(Icons.arrow_forward, color: Colors.blue),
        onTap: onPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.choosePaymentMethod),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildPaymentMethodCard(context, S.current.cashOnDelivery,
                Icons.delivery_dining, () => navigateToCashOnDelivery(context)),
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

class DelayedCashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.delayedCash),
      ),
      body: Center(
        child: Text(S.current.delayedCashScreen),
      ),
    );
  }
}
