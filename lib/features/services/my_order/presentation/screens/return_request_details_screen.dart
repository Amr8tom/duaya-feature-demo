import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/services/my_order/presentation/controller/order_refund_controller/order_refund_controller_cubit.dart';
import 'package:duaya_app/features/services/my_order/presentation/widgets/refund_details/refound_submit_details_button.dart';
import 'package:duaya_app/features/services/my_order/presentation/widgets/refund_details/refund_details_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../generated/l10n.dart';
import '../../../../service_locator/serrvice_locator.dart';

class ReturnRequestDetailsScreen extends StatelessWidget {
  final String orderID;

  const ReturnRequestDetailsScreen({super.key, required this.orderID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<OrderRefundControllerCubit>(),
      child: Scaffold(
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
                RefoundSubmitDetailsButton(
                  orderID: orderID,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
