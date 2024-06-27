import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../utils/constants/colors.dart';

class TextWithTextField extends StatelessWidget {
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

  TextWithTextField(
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 7),
          child: Text(title, style: Theme.of(context).textTheme.headlineMedium),
        ),
        Container(
          height: hight ?? 50,
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius ?? 60),
              // color: ColorRes.primary,
              border: Border.all()),
          padding: const EdgeInsets.all(1),
          child: Container(
            child: TextField(
              readOnly: toggle,
              controller: controller,
              onTap: () async {
                onTab;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9.0),
                    borderSide: BorderSide(
                        color: isError ? ColorRes.error2 : ColorRes.transparent,
                        width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9.0),
                    borderSide: BorderSide(
                        color: isError ? ColorRes.error2 : ColorRes.transparent,
                        width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              isError ? ColorRes.error2 : ColorRes.transparent,
                          width: 1.5),
                      borderRadius: BorderRadius.circular(9)),
                  fillColor: ColorRes.white.withOpacity(0.3),
                  filled: true,
                  hintText: hintText ?? " ",
                  hintStyle: TextStyle(color: Colors.red),
                  icon: hintIcon),
              cursorColor: isError ? ColorRes.error2 : ColorRes.transparent,
              keyboardType: textType ?? TextInputType.text,
            ),
          ),
        )
      ],
    );
  }
}
