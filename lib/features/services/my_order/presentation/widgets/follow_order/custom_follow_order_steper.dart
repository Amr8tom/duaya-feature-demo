import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';

class CustomFollowOrderSteper extends StatelessWidget {
  const CustomFollowOrderSteper({super.key});

  @override
  Widget build(BuildContext context) {
    return Stepper(
      controlsBuilder: (BuildContext context, ControlsDetails details) {
        return SizedBox();
      },
      steps: [
        Step(
            title: Text(S.current.orederPlaced),
            content: Text(S.current.orederPlacedBody)),
        Step(
            title: Text(S.current.accepted),
            content: Text(S.current.acceptedBody)),
        Step(
            title: Text(S.current.packing),
            content: Text(S.current.packingBody)),
        Step(
            title: Text(S.current.shipping),
            content: Text(S.current.shippingBody)),
        Step(
            title: Text(S.current.Delivered),
            content: Text(S.current.DeliveredBody)),
      ],
    );
  }
}
