import 'package:duaya_app/common/custom_ui.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../common/widgets/custom_container/custom_order_contanier.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../routing/routes_name.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../controller/my_orders_controller/my_orders_cubit.dart';

class CurrentOrderList extends StatelessWidget {
  const CurrentOrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrdersCubit, MyOrdersState>(
      builder: (context, state) {
        print("state==========================> $state");
        print("state==========================> $state");
        print("state==========================> $state");
        print("state==========================> $state");
        print("state==========================> $state");
        if (state is MyOrdersSuccess) {
          if (state.ordersModel.data?.length != 0) {
            return ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: AppSizes.spaceBtwItems);
                },
                itemCount: state.ordersModel.data!.length,
                itemBuilder: (context, index) {
                  final orderNumber = state.ordersModel.data![index].id;
                  final paymentStatus =
                      state.ordersModel.data![index].paymentStatus;
                  final date = state.ordersModel.data![index].date;
                  final cost = state.ordersModel.data![index].grandTotal;
                  final deliveryStatus =
                      state.ordersModel.data![index].deliveryStatus;
                  final bool isDelevied = (deliveryStatus == "delivered");
                  return isDelevied
                      ? SizedBox()
                      : CustomOrderContanier(
                          isRowLeftBotton: true,
                          isTopLeftBotton: false,
                          isDelevied: isDelevied,
                          rightBotton: S.current.details,
                          leftBotton: S.current.followOrder,
                          productNumberFiled: orderNumber.toString(),
                          statusFiled: paymentStatus.toString(),
                          dateFiled: date.toString(),
                          costFiled: cost.toString(),
                          onLeftButtonTap: () => context.pushNamed(
                              DRoutesName.followOrderRoute,
                              arguments: orderNumber.toString()),
                          onRightButtonTap: () => context.pushNamed(
                              DRoutesName.orderDetailsRoute,
                              arguments: {
                                "orderID": orderNumber.toString(),
                                "isRefundable": false
                              }),
                          image: AssetRes.truck,
                          title: S.current.color,
                          body: S.current.search,
                        );
                });
          } else {
            return CustomUI.noData();
          }
        } else {
          return CustomUI.simpleLoader();
        }
      },
    );
  }
}
