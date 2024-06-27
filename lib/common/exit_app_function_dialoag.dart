import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<bool?> showExitConfirmationDialog({required BuildContext context}) {
  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      // iconColor: ,
      backgroundColor: ColorRes.error2.withOpacity(0.8),
      title: Text(
        S.current.exitApp,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: ColorRes.white),
      ),
      content: Text(
        S.current.confirmExitMessage,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: ColorRes.white),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false); // User pressed No
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
          onPressed: () {
            Navigator.of(context).pop(true); // User pressed Yes
          },
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
