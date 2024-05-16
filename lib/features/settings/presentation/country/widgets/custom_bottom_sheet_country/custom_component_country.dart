import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomComponentCountry extends StatelessWidget {
  const CustomComponentCountry({Key? key, required this.countryName,required this.imageCountry}) : super(key: key);
  final String countryName, imageCountry;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.spaceBtwItems),
      child: Container(
        width: width,
        margin: EdgeInsets.symmetric(vertical: AppSizes.spaceBtwItems / 2),
        padding: EdgeInsets.symmetric(horizontal: AppSizes.spaceBtwItems ,vertical: AppSizes.spaceBtwItems / 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusSm),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Row(
          children: [
            Image.asset(imageCountry),
            SizedBox(width: AppSizes.padding),
            Text(countryName, style:  Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
