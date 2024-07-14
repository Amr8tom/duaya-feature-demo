import 'package:duaya_app/features/category/presentation/category/presentation/controller/companies_by_page_cubit.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../routing/routes_name.dart';
import '../../../../home/presentation/widgets/custom_container_product/custom_container_product.dart';

class newProductGridView extends StatelessWidget {
  CompaniesByPageCubit companyDetailsController = CompaniesByPageCubit();
  newProductGridView({super.key, required this.companyDetailsController});

  @override
  Widget build(BuildContext context) {
    return companyDetailsController.newCompanyModel.data!.length == 0
        ? Center(
            child: Container(
                child: Text(
              S.current.noData,
              style: Theme.of(context).textTheme.headlineMedium,
            )),
          )
        : GridView.builder(
            // physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.h,
              childAspectRatio: 1.2 / 2.2,
            ),
            // shrinkWrap: true,
            itemCount: companyDetailsController.newCompanyModel.data!.length!,
            itemBuilder: (context, index) {
              String image = companyDetailsController
                  .newCompanyModel.data![index].thumbnailImage!;
              String ID = companyDetailsController
                  .newCompanyModel.data![index].id!
                  .toString();
              String shopName = companyDetailsController
                  .newCompanyModel.data![index].shopName!;
              String name =
                  companyDetailsController.newCompanyModel.data![index].name!;
              String discount = companyDetailsController
                  .newCompanyModel.data![index].discount!;
              String price = companyDetailsController
                  .newCompanyModel.data![index].mainPrice!;
              String strokedPrice = companyDetailsController
                  .newCompanyModel.data![index].strokedPrice!;
              bool hasDiscount = companyDetailsController
                  .newCompanyModel.data![index].hasDiscount!;
              return GestureDetector(
                onTap: () async {
                  // await bestSellerController.fetchProductData(
                  //     productID: ID);
                  context
                      .pushNamed(DRoutesName.detailsProductRoute, arguments: {
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
                  productID: ID,
                ),
              );
            },
          );
  }
}
