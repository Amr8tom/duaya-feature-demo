// order_details_body.dart
import 'package:duaya_app/features/services/my_order/presentation/widgets/order_details/custom_single_item.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:duaya_app/features/services/my_order/presentation/controller/order_items_controller/orer_items_cubit.dart';
import 'package:duaya_app/common/custom_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../routing/routes_name.dart';
import 'custom_card_order_details_info.dart';

class OrderDetalisBody extends StatelessWidget {
  final Map<String, dynamic> args;
  const OrderDetalisBody({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrerItemsCubit, OrerItemsState>(
      builder: (context, state) {
        if (state is OrerItemsLoading) {
          return CustomUI.simpleLoader();
        } else if (state is OrerItemsSuccess) {
          return BlocBuilder<OrerItemsCubit, OrerItemsState>(
            builder: (context, state) {
              if (state is OrerItemsSuccess) {
                if (state.orderItems.data?.length == 0) {
                  return CustomUI.noData();
                } else {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 10.h,
                      childAspectRatio: 2.6 / 1,
                    ),
                    itemCount: state.orderItems.data?.length,
                    itemBuilder: (BuildContext, index) {
                      final cost = state.orderItems.data?[index].price;
                      final productName =
                          state.orderItems.data?[index].productName;
                      final paymentStatus =
                          state.orderItems.data?[index].paymentStatus;
                      final deliveryStatus =
                          state.orderItems.data?[index].deliveryStatus;
                      final quantitiy = state.orderItems.data?[index].quantity;
                      return CustomSingleItem(
                          isRefundable: args['isRefundable'],
                          onTap: () => context.pushNamed(
                              DRoutesName.returnRequestDeatilsRoute,
                              arguments: args["orderID"]),
                          itemName: productName.toString(),
                          itemCost: cost.toString(),
                          itemQutantity: quantitiy.toString());
                    },
                  );
                }
              } else {
                return CustomUI.simpleLoader();
              }
            },
          );
        } else {
          return CustomUI.noData();
        }
      },
    );
  }
}
