import 'package:duaya_app/features/services/my_order/presentation/controller/order_refund_controller/order_refund_controller_cubit.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../generated/l10n.dart';

class RefundDetailsForm extends StatelessWidget {
  const RefundDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final refundController = context.read<OrderRefundControllerCubit>();
    return TextFormField(
      maxLines: 18,
      controller: refundController.reasonController,
      decoration: InputDecoration(
          hintText: "${S.current.refundReason} . . . ",
          hintStyle: TextStyle(color: ColorRes.grey)),
    );
  }
}
