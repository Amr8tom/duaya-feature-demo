import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/common/widgets/custom_button/custom_button_with_icon.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GiftScreen extends StatelessWidget {
  const GiftScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: DAppBar(
          bgColor: ColorRes.appBarColor,
          showBackGroundColor: true,
          centerTitle: true,
          showBackArrow: true,
          arrowBackColor: true,
          /// Flash Title
          title: Text('Cash Back', style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 18.sp, color: ColorRes.white)),
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.padding / 2),
          child: Column(
            children: [
              Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(AppSizes.padding),
                  decoration: BoxDecoration(
                    color: ColorRes.white,
                    borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
                  ),
                  child: Column(
                    children: [
                      Text('You Have : 2700 Point', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: ColorRes.primary, fontSize: 16.5.sp), overflow: TextOverflow.ellipsis),
                      SizedBox(height: AppSizes.defaultSpace / 2),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Text('You Can Convert Your Points To : ', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: ColorRes.primary), overflow: TextOverflow.ellipsis),
                          ),
                          Expanded(
                            child: Text('200 EGP', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: ColorRes.error2), overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSizes.defaultSpace),
                      CustomButtonWithIcon(textButton: 'Refused', width: width / 2.5, color: ColorRes.error2, onTap: () {}, borderColor: Colors.transparent, textButtonColor: ColorRes.white, isAddToCart: false),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
