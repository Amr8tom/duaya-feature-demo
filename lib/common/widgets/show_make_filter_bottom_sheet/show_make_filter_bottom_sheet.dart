import 'package:duaya_app/common/widgets/checkbox/check_box.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/exports.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowMakeFilterBottomSheet extends StatelessWidget {
  const ShowMakeFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = DHelperFunctions.isDarkMode(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.spaceBtwItems),
      child: Column(
        children: [
          const Divider(),
          CustomCheckBox(
            onPressed: () => {},
            borderColor: ColorRes.primary,
            checkIconWidget: Icon(Icons.check, size: 18.sp, color: ColorRes.primary),
            textForCheckBox: Text('There are no preferences', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorRes.black, fontWeight: FontWeight.w600)),
          ),
          const Divider(),
          CustomCheckBox(
            onPressed: () => {},
            borderColor: ColorRes.primary,
            checkIconWidget: Icon(Icons.check, size: 18.sp, color: ColorRes.primary),
            textForCheckBox: Text('The closest', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorRes.black, fontWeight: FontWeight.w600)),
          ),
          const Divider(),
          CustomCheckBox(
            onPressed: () => {},
            borderColor: ColorRes.primary,
            checkIconWidget: Icon(Icons.check, size: 18.sp, color: ColorRes.primary),
            textForCheckBox: Text('The fastest', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorRes.black, fontWeight: FontWeight.w600)),
          ),
          const Divider(),
          /// Done Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              backgroundColor: dark ? ColorRes.primary : ColorRes.primary,
              // fixeAppSizes: Size(100.w, 40.h),
              padding: EdgeInsets.symmetric(horizontal: 40.w),
            ),
            onPressed: () {},
            child: const Text("Done"),
          ),
        ],
      ),
    );
  }
}