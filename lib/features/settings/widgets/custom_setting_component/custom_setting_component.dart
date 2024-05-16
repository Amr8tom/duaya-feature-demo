import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSettingComponent extends StatelessWidget {
  final IconData iconData;
  final String titleOfComponent, description;
  const CustomSettingComponent({Key? key, required this.iconData, required this.titleOfComponent, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        CircleAvatar(
          radius: 25.r,
          backgroundColor: ColorRes.primary.withOpacity(0.4),
          child: Center(
            child: Icon(iconData,color: ColorRes.primary),
          ),
        ),
        SizedBox(width: AppSizes.padding),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(titleOfComponent, style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16.sp)), description.isEmpty? Container() : SizedBox(height: AppSizes.spaceBtwTexts * 1.5),
            SizedBox(width: width / 1.8, child: Text(description, style: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorRes.silver, fontSize: 14.sp))),
          ],
        ),
        const Spacer(),
        Icon(Icons.arrow_forward_ios,color:  ColorRes.silver, size: 18.sp)
      ],
    );
  }
}
