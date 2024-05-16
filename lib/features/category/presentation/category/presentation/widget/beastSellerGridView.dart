import 'package:duaya_app/features/category/presentation/category/presentation/controller/companies_by_page_cubit.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../routing/routes_name.dart';
import '../../../../../home/presentation/widgets/custom_container_product/custom_container_product.dart';

class bestSellerGridView extends StatelessWidget {
  CompaniesByPageCubit companyDetailsController = CompaniesByPageCubit();
  bestSellerGridView({super.key, required this.companyDetailsController});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 20.h,
        childAspectRatio: 0.36,
      ),
      // shrinkWrap: true,
      itemCount: companyDetailsController.bestSellerCompanyModel.data!.length!,
      itemBuilder: (context, index) {
        String image = companyDetailsController
            .bestSellerCompanyModel.data![index].thumbnailImage!;
        String ID = companyDetailsController
            .bestSellerCompanyModel.data![index].id!
            .toString();
        String shopName = companyDetailsController
            .bestSellerCompanyModel.data![index].shopName!;
        String name =
            companyDetailsController.bestSellerCompanyModel.data![index].name!;
        String discount = companyDetailsController
            .bestSellerCompanyModel.data![index].discount!;
        String price = companyDetailsController
            .bestSellerCompanyModel.data![index].mainPrice!;
        String strokedPrice = companyDetailsController
            .bestSellerCompanyModel.data![index].strokedPrice!;
        bool hasDiscount = companyDetailsController
            .bestSellerCompanyModel.data![index].hasDiscount!;
        return GestureDetector(
          onTap: () async {
            // await bestSellerController.fetchProductData(
            //     productID: ID);
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
            productImage: image,
            productName: name,
            companyName: shopName,
            discount: discount,
            rete: 4.5,
            price: price,
            hasDicount: hasDiscount,
            strockedPrice: strokedPrice,
          ),
        );
      },
    );
  }
}
