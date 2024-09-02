import 'package:duaya_app/common/custom_ui.dart';
import 'package:duaya_app/features/services/my_order/presentation/controller/order_refund_controller/order_refund_controller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../common/widgets/custom_container/custom_order_contanier.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';

class RefundRequestList extends StatelessWidget {
  const RefundRequestList({super.key});

  @override
  Widget build(BuildContext context) {
    final refundController = context.read<OrderRefundControllerCubit>();
    refundController.getAllRefundRequest();
    return BlocBuilder<OrderRefundControllerCubit, OrderRefundControllerState>(
      builder: (context, state) {
        if (state is OrderRefundControllerSuccessed) {
          if (state.refundRequestsModel?.data?.length == 0) {
            return CustomUI.noData();
          } else {
            return ListView.separated(
              itemCount: state.refundRequestsModel!.data!.length,
              itemBuilder: (context, index) {
                final name = state.refundRequestsModel!.data![index].productName
                    .toString();
                final reason =
                    state.refundRequestsModel!.data![index].reason.toString();
                final rejectReason = state
                    .refundRequestsModel!.data![index].rejectReason
                    .toString();
                final refund_status = state
                    .refundRequestsModel!.data![index].refundLabel
                    .toString();

                final date =
                    state.refundRequestsModel!.data![index].date.toString();
                final cost = state
                    .refundRequestsModel!.data![index].productPrice
                    .toString();
                final status = state
                    .refundRequestsModel!.data![index].refundStatus
                    .toString();
                return CustomOrderContanier(
                  isRowLeftBotton: true,
                  isRefund: true,
                  isTopLeftBotton: false,
                  isDelevied: true,
                  image: AssetRes.refundIcon,
                  divideNum: 5,
                  title: name,
                  refundReason: reason,
                  dateFiled: date,
                  statusFiled: refund_status,
                  costFiled: cost,
                  body: S.current.search,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: AppSizes.spaceBtwItems);
              },
            );
          }
        } else {
          return CustomUI.simpleLoader();
        }
      },
    );
    ;
  }
}
