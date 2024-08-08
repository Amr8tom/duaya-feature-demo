import 'package:duaya_app/features/home/presentation/controller/best_seller_cubit.dart';
import 'package:duaya_app/features/relatedProducts/presentation/widget/relatedContainerProduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constants/image_strings.dart';

class relatedProducts extends StatelessWidget {
  relatedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final bestSellerController = context.read<BestSellerCubit>();
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 10.h,
            childAspectRatio: 3.1 / 2,
          ),
          shrinkWrap: true,
          itemCount: bestSellerController.relatedProduct.data?.length,
          itemBuilder: (context, index) {
            final name = bestSellerController.relatedProduct.data?[index].name;
            final unitPrice =
                bestSellerController.relatedProduct.data?[index].mainPrice;
            final discount =
                bestSellerController.relatedProduct.data?[index].discount;
            bool? isDiscont =
                bestSellerController.relatedProduct.data?[index].hasDiscount;
            final currentStock =
                bestSellerController.relatedProduct.data?[index].strokedPrice;
            String? companyName =
                bestSellerController.relatedProduct.data?[index].shopName;
            final ID = bestSellerController.relatedProduct.data![index].id;
            // final quantitiy = bestSellerController.relatedProduct.data![index];
            return RelatedContainerProduct(
              productImage: AssetRes.product,
              productName: name!,
              price: unitPrice!,
              isCart: true,
              strockedPrice: "${currentStock.toString()}",
              hasDicount: true,
              discount: discount.toString(),
              companyName: companyName ?? "", productID: ID.toString(),
              // rete: 4.5,
            );
          },
        )
      ],
    );
  }
}
