import 'package:duaya_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFieldSearch extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function(String) onChange;
  final Function()? onTapOutside;

  CustomTextFormFieldSearch({
    Key? key,
    required this.hintText,
    this.onTapOutside,
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
              .copyWith(color: ColorRes.greenBlue),
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorRes.white.withOpacity(0.5),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: ColorRes.lightGreen),
            ),
            hintText: hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.grey),
            prefixIcon:
                Icon(Icons.search, color: ColorRes.greenBlue, size: 25.sp),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          ),
          onChanged: onChange,
          onTapOutside: (s) async {
            onTapOutside;
            print(
                "donnnnnnnnnnnnedonnnnnnnnnnnnedonnnnnnnnnnnnedonnnnnnnnnnnnedonnnnnnnnnnnne");
          },
          onEditingComplete: () async {
            onTapOutside;
            print(
                "donnnnnnnnnnnnedonnnnnnnnnnnnedonnnnnnnnnnnnedonnnnnnnnnnnnedonnnnnnnnnnnne");
          },
        ),
      ),
    );
  }
}
