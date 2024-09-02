import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../../utils/constants/colors.dart';

class CustomContentStepOneBody extends StatelessWidget {
  const CustomContentStepOneBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(S.current.orederPlacedBody),
        TextButton(
            onPressed: () {
              _showExitConfirmationDialog(context: context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorRes.greenBlueLight,
                  border: Border.all(width: 2, color: ColorRes.greenBlue)),
              child: Text(
                S.current.cancleOrder,
                style: TextStyle(color: ColorRes.greenBlue),
              ),
            ))
      ],
    );
  }
}

Future<bool?> _showExitConfirmationDialog({required BuildContext context}) {
  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      // iconColor: ,
      backgroundColor: ColorRes.greenBlue,
      title: Text(
        S.current.cancleOrder,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: ColorRes.white),
      ),
      content: Text(
        S.current.cancleOrderBody,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: ColorRes.white),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text(
            S.current.no,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: ColorRes.white),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            S.current.yes,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: ColorRes.white),
          ),
        ),
      ],
    ),
  );
}
