import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/common/widgets/custom_button/custom_button_with_icon.dart';
import 'package:duaya_app/features/services/refund_request/presentation/widget/refund_request_list.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ReturnRequestScreen extends StatelessWidget {
  ReturnRequestScreen({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: DAppBar(
        title: Text(S.current.returnRequest),
        centerTitle: true,
        showBackArrow: true,
      ),
      body: const RefundRequestList(),
    );
  }
}
