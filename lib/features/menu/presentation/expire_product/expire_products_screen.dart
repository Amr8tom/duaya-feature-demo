import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/common/widgets/floating_action_button/custom_floating_action_button.dart';
import 'package:duaya_app/features/home/presentation/widgets/custom_container_product/custom_container_product.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpireProductsScreen extends StatelessWidget {
  const ExpireProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        title: Text(S.current.expiredProduct),
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
                  productImage: AssetRes.product,
                  productName: "Panadol Extra",
                  price: "500",
                  hasDicount: false,
                  companyName: "gsk company",
                  rete: 4.5,
                ));
          },
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
          textButton: S.current.newProduct,
          onPressed: () => context.pushNamed(DRoutesName.addNewProductRoute)),
    );
  }
}
