import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final String textButton;
  final void Function() onPressed;
  const CustomFloatingActionButton({Key? key, required this.textButton, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      elevation: 0,
      onPressed: onPressed,
      label: Row(
        children: [
          Text(textButton, style: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorRes.white)),
          SizedBox(width: AppSizes.spaceBetweenIcon),
          const Icon(Icons.arrow_forward,color: ColorRes.white)
        ],
      ),
      backgroundColor: ColorRes.primary,
    );
  }
}