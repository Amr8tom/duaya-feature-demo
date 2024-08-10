import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/services/refund_request/presentation/widget/refound_submit_details_button.dart';
import 'package:duaya_app/features/services/refund_request/presentation/widget/refund_details_form.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class ReturnRequestDetailsScreen extends StatelessWidget {
  const ReturnRequestDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        title: Text(S.current.returnDetailsRequest),
      ),
      body: Stack(
        children: [
          const RefundDetailsForm(),
          const RefoundSubmitDetailsButton()
        ],
      ),
    );
  }
}
