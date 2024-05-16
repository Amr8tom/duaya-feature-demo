import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/exports.dart';
import 'package:duaya_app/utils/language/language_helper.dart';
import 'package:flutter/material.dart';

class CustomSearchInAppBar extends StatelessWidget {
  const CustomSearchInAppBar({super.key, required this.suffixIcon, required this.onChanged});

  final void Function(String) onChanged;
  final Widget suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      cursorColor: ColorRes.primary,
      style: Theme.of(context).textTheme.bodyMedium,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'search',
        hintStyle: Theme.of(context).textTheme.titleMedium,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorRes.grey,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorRes.grey,
          ),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}