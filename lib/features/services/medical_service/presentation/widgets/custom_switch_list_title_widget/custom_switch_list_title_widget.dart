// custom_switch_list_tile.dart
import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';

class CustomSwitchListTitleWidget extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  CustomSwitchListTitleWidget({
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(
        title,
        maxLines: 3,
        style: TextStyle(
            color: ColorRes.greenBlue), // Replace with your color resource
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}
