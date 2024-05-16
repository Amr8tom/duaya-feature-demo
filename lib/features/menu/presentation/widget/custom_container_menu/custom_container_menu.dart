import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerMenu extends StatelessWidget {
final  IconData iconData;
final  String text;
  const CustomContainerMenu({Key? key,required this.text, required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace / 2),
      elevation: 3,
        color:  ColorRes.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
        ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.spaceBtwTexts),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25.r,
                backgroundColor: ColorRes.primary,
                child: Icon(iconData,size: 23.sp,color: ColorRes.white),
              ),
              SizedBox(height: AppSizes.spaceBtwTexts * 1.2),
              Text(text,style: Theme.of(context).textTheme.titleSmall!.copyWith(overflow: TextOverflow.ellipsis)),
            ],
          ),
        ),
      ),
    );
  }
}
