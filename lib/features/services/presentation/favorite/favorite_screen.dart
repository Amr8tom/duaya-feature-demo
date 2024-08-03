import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/home/presentation/widgets/custom_container_product/custom_container_product.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DAppBar(
          title: Text(S.current.favorite),
          centerTitle: true,
          showBackArrow: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: AppSizes.spaceBtwItems),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.h,
              childAspectRatio: 1 / 2.2,
            ),
            shrinkWrap: true,
            itemCount: 12,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    context.pushNamed(DRoutesName.detailsProductRoute);
                  },
                  child: CustomContainerProduct(
                    productID: "ID",
                    productImage: AssetRes.product,
                    productName: "Amr Alaa",
                    companyName: "Top one",
                    rete: 5,
                    hasDicount: false,
                    price: '1KK',
                  ));
            },
          ),
        ));
  }
}
