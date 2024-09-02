import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../routing/routes_name.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../home/presentation/widgets/custom_container_product/custom_container_product.dart';

class CustomCustomerAdsBody extends StatelessWidget {
  const CustomCustomerAdsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.spaceBtwItems),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.h,
          childAspectRatio: 1 / 1.5,
        ),
        shrinkWrap: true,
        itemCount: 12,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                context.pushNamed(DRoutesName.detailsProductRoute);
              },
              child: CustomContainerProduct(
                productImage: AssetRes.product,
                productName: "product",
                companyName: "Duaya",
                rete: 4.5,
                hasDicount: false,
                price: "199",
                productID: 'ID',
                color: ColorRes.grey,
                isCart: false,
                isAds: true,
              ));
        },
      ),
    );
  }
}
