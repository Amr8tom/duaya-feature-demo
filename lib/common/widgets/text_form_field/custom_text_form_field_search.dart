import 'package:duaya_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFieldSearch extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function(String) onChange;

  CustomTextFormFieldSearch({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Card(
      child: SizedBox(
        width: width / 1.05,
        child: TextFormField(
          controller: controller,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.grey[700]),
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorRes.white.withOpacity(0.5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: ColorRes.primary),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.grey),
            ),
            hintText: hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.grey),
            prefixIcon: Icon(Icons.search, color: Colors.grey, size: 25.sp),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          ),
          onChanged: onChange,
          onTapOutside: (s) {
            print(
                "donnnnnnnnnnnnedonnnnnnnnnnnnedonnnnnnnnnnnnedonnnnnnnnnnnnedonnnnnnnnnnnne");
          },
          onEditingComplete: () {
            print(
                "donnnnnnnnnnnnedonnnnnnnnnnnnedonnnnnnnnnnnnedonnnnnnnnnnnnedonnnnnnnnnnnne");
          },
        ),
      ),
    );
  }
}
