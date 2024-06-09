import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';

class CashOnDeliveryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.cashOnDelivery),
      ),
      body: Center(
        child: Text(S.current.cashOnDeliveryScreen),
      ),
    );
  }
}
