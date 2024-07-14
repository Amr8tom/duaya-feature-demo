import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../utils/constants/colors.dart';

class TextWithTextFieldForRrgistration extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool isError;
  double? radius;
  double? hight;
  TextInputType? textType;
  bool toggle;
  Function? onTab;
  String? hintText;
  Widget? hintIcon;

  TextWithTextFieldForRrgistration(
      {super.key,
      required this.title,
      required this.controller,
      this.onTab,
      this.radius,
      this.hight,
      this.textType,
      this.isError = false,
      this.toggle = false,
      this.hintText,
      this.hintIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hight ?? 65,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 10),
      ),
      padding: const EdgeInsets.all(1),
      child: Container(
        child: TextField(
          readOnly: toggle,
          controller: controller,
          onTap: () async {
            onTab;
          },
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                    color: isError ? ColorRes.error2 : ColorRes.greenBlue,
                    width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: isError ? ColorRes.error2 : ColorRes.greenBlue,
                      width: 1.5),
                  borderRadius: BorderRadius.circular(10)),
              fillColor: ColorRes.white.withOpacity(0.3),
              filled: true,
              hintText: hintText ?? title,
              hintStyle: TextStyle(color: Colors.grey),
              icon: hintIcon),
          // cursorColor: isError ? ColorRes.error2 : ColorRes.greenBlue,
          keyboardType: textType ?? TextInputType.text,
        ),
      ),
    );
  }
}
