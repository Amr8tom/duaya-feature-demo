import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../routing/routes_name.dart';
import '../../../../utils/constants/colors.dart';
import '../controller/best_seller_cubit.dart';
import 'custom_container_product/custom_container_product.dart';

class BestsellerProductList extends StatelessWidget {
  const BestsellerProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final bestSellerController = context.read<BestSellerCubit>();

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5.h,
        childAspectRatio: 1.2 / 2.45,
      ),
      shrinkWrap: true,
      itemCount: bestSellerController.bestSellerModel.data?.length,
      itemBuilder: (context, index) {
        String? image =
            bestSellerController.bestSellerModel.data?[index].thumbnailImage!;
        String ID =
            bestSellerController.bestSellerModel.data![index].id!.toString() ??
                "";
        String shopName =
            bestSellerController.bestSellerModel.data![index].shopName! ?? "";
        String name =
            bestSellerController.bestSellerModel.data![index].name! ?? "";
        String discount =
            bestSellerController.bestSellerModel.data![index].discount ?? ""!;
        String price =
            bestSellerController.bestSellerModel.data![index].mainPrice! ?? "";
        String strokedPrice =
            bestSellerController.bestSellerModel.data![index].strokedPrice! ??
                "";
        bool hasDiscount =
            bestSellerController.bestSellerModel.data![index].hasDiscount!;
        // bool isVarient= bestSellerController.bestSellerModel.data![index]
        return GestureDetector(
          onTap: () {
            context.pushNamed(DRoutesName.detailsProductRoute, arguments: {
              "productName": name,
              "productID": ID,
              "discount": ID,
              "productImage": image,
              "companyName": shopName,
              "discount": discount,
              "price": price,
              "strockedPrice": strokedPrice,
              "hasDicount": hasDiscount,
            });
          },
          child: CustomContainerProduct(
            color: ColorRes.greyGreen,
            productImage: image,
            productName: name,
            companyName: shopName,
            discount: discount,
            price: price,
            hasDicount: hasDiscount,
            strockedPrice: strokedPrice,
            rete: 5,
            productID: ID,
          ),
        );
      },
    );
  }
}
