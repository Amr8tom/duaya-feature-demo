import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomCheckInCategory extends StatelessWidget {
  final String textButton;
  final VoidCallback onTap;
  final bool isPressed ;
  const CustomCheckInCategory({Key? key,required this.textButton, required this.onTap,required this.isPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Text(textButton,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorRes.primary)),
            SizedBox(height: AppSizes.spaceBtwItems),
           isPressed ?  Container(
              height: height / 150,
              width: width / 4,
              decoration: BoxDecoration(
                color: ColorRes.primary,
                borderRadius: BorderRadius.only(topRight: Radius.circular(AppSizes.borderRadiusLg), topLeft: Radius.circular(AppSizes.borderRadiusLg))
              ),
            ) : SizedBox(),
          ],
        ),
      ),
    );
  }
}
