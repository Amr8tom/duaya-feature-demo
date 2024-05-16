import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class TextWithTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool isError;
  bool toggle;
  String? hintText;

  TextWithTextField(
      {super.key,
      required this.title,
      required this.controller,
      this.isError = false,
      this.toggle = false,
      this.hintText});

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
          child: Text(
            title,
            style: const TextStyle(
                color: ColorRes.black, fontSize: 18, fontWeight: FontWeight.bold
                // fontFamily: FontRes.regular
                ),
          ),
        ),
        Container(
          height: 55,
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorRes.transparent,
          ),
          padding: const EdgeInsets.all(1),
          child: TextField(
            readOnly: toggle,
            controller: controller,
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
                        color: isError ? ColorRes.error2 : ColorRes.transparent,
                        width: 1.5),
                    borderRadius: BorderRadius.circular(9)),
                fillColor: ColorRes.white.withOpacity(0.3),
                filled: true,
                hintText: hintText ?? " "),
            cursorColor: isError ? ColorRes.error2 : ColorRes.transparent,
          ),
        )
      ],
    );
  }
}
