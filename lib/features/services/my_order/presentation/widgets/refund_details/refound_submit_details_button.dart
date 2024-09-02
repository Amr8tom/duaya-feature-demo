import 'package:duaya_app/common/common_snak_bar_widget.dart';
import 'package:duaya_app/common/custom_ui.dart';
import 'package:duaya_app/features/services/my_order/presentation/controller/order_refund_controller/order_refund_controller_cubit.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../generated/l10n.dart';

class RefoundSubmitDetailsButton extends StatelessWidget {
  final String orderID;
  const RefoundSubmitDetailsButton({super.key, required this.orderID});

  @override
  Widget build(BuildContext context) {
    final refundController = context.read<OrderRefundControllerCubit>();
    return BlocBuilder<OrderRefundControllerCubit, OrderRefundControllerState>(
      builder: (context, state) {
        if (state is OrderRefundControllerloading) {
          return CustomUI.simpleLoader();
        } else if (state is OrderRefundControllerSuccessed) {
          context.pop();
          commonToast(state.sendRefundModel?.message ?? S.current.done);
          return SizedBox();
        } else {
          if (state is OrderRefundControllerFailure) {
            commonToast(S.current.error);
          }
          return ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(
                  Size(196.w, 10.h), // Adjust button size
                ),
              ),
              onPressed: () {
                refundController.sendRefundRequest(orderID: orderID);
              },
              child: Text(
                S.current.sendProduct,
                style: TextStyle(color: ColorRes.white),
              ));
        }
      },
    );
  }
}
