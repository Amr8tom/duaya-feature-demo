import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/services/refund_request/presentation/widget/refound_submit_details_button.dart';
import 'package:duaya_app/features/services/refund_request/presentation/widget/refund_details_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';

class ReturnRequestDetailsScreen extends StatelessWidget {
  const ReturnRequestDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      appBar: DAppBar(
        showBackArrow: true,
        centerTitle: true,
        title: Text(S.current.returnDetailsRequest),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              const RefundDetailsForm(),
              SizedBox(
                height: 80.h,
              ),
              const RefoundSubmitDetailsButton()
            ],
          ),
        ),
      ),
    );
  }
}
