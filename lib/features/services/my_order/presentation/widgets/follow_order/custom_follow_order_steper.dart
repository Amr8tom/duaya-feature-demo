import 'package:duaya_app/common/custom_ui.dart';
import 'package:duaya_app/features/services/my_order/presentation/widgets/follow_order/custom_content_step_one_Body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../generated/l10n.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../controller/order_details_controller/order_details_cubit.dart';

class CustomFollowOrderSteper extends StatelessWidget {
  final String orderID;
  const CustomFollowOrderSteper({super.key, required this.orderID});

  @override
  Widget build(BuildContext context) {
    final orderDetailsController = context.read<OrderDetailsCubit>();
    orderDetailsController..fetchOrderDetails(orderID: orderID);
    return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
      builder: (context, state) {
        print("state=========================>$state");
        print("state=========================>$state");
        print("state=========================>$state");
        if (state is OrderDetailsLoading) {
          return CustomUI.simpleLoader();
        } else if (state is OrderDetailsSuccessed) {
          List statusList = _getStatusList(
              state.orderDetails!.data![0].deliveryStatusString!);
          return Stepper(
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return SizedBox();
            },
            steps: [
              Step(
                  stepStyle: StepStyle(
                    color: statusList[0] ? ColorRes.greenBlue : ColorRes.grey,
                    connectorColor: ColorRes.greenBlue,
                  ),
                  state: statusList[0] ? StepState.complete : StepState.indexed,
                  isActive: statusList[0],
                  title: Text(S.current.orederPlaced),
                  content: statusList[1]
                      ? SizedBox()
                      : const CustomContentStepOneBody()),
              Step(
                  state: statusList[1] ? StepState.complete : StepState.indexed,
                  stepStyle: StepStyle(
                    color: statusList[1] ? ColorRes.greenBlue : ColorRes.grey,
                    connectorColor: ColorRes.greenBlue,
                  ),
                  isActive: statusList[1],
                  title: Text(S.current.accepted),
                  content: Text(S.current.acceptedBody)),
              Step(
                  stepStyle: StepStyle(
                    color: statusList[2] ? ColorRes.greenBlue : ColorRes.grey,
                    connectorColor: ColorRes.greenBlue,
                  ),
                  state: statusList[2] ? StepState.complete : StepState.indexed,
                  isActive: statusList[2],
                  title: Text(S.current.packing),
                  content: Text(S.current.packingBody)),
              Step(
                  stepStyle: StepStyle(
                    color: statusList[3] ? ColorRes.greenBlue : ColorRes.grey,
                    connectorColor: ColorRes.greenBlue,
                  ),
                  state: statusList[3] ? StepState.complete : StepState.indexed,
                  isActive: statusList[3],
                  title: Text(S.current.shipping),
                  content: Text(S.current.shippingBody)),
              Step(
                  stepStyle: StepStyle(
                    color: ColorRes.grey,
                    connectorColor: ColorRes.greenBlue,
                  ),
                  // state: statusList[4] ? StepState.complete : StepState.indexed,
                  isActive: statusList[4],
                  title: Text(S.current.Delivered),
                  content: Text(S.current.DeliveredBody)),
            ],
          );
        } else {
          return CustomUI.noData();
        }
      },
    );
  }
}

List<bool> _getStatusList(String currentStatus) {
  List<bool> statusFlags = List.generate(5, (index) => false);

  switch (currentStatus) {
    case "Order Placed":
      statusFlags[0] = true;
      break;
    case "Confirmed":
      statusFlags[0] = true;
      statusFlags[1] = true;
      break;
    case "Picked Up":
      statusFlags[0] = true;
      statusFlags[1] = true;
      statusFlags[2] = true;
      break;
    case "On The Way":
      statusFlags[0] = true;
      statusFlags[1] = true;
      statusFlags[2] = true;
      statusFlags[3] = true;
      break;
    case "Delivered":
      statusFlags[0] = true;
      statusFlags[1] = true;
      statusFlags[2] = true;
      statusFlags[3] = true;
      break;
    default:
      // Handle any unexpected status if needed
      break;
  }

  return statusFlags;
}
