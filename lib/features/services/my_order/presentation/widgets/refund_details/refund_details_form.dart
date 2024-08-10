import 'package:duaya_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';

class RefundDetailsForm extends StatelessWidget {
  const RefundDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 18,
      decoration: InputDecoration(
          hintText: "${S.current.refundReason} . . . ",
          hintStyle: TextStyle(color: ColorRes.grey)),
    );
  }
}
