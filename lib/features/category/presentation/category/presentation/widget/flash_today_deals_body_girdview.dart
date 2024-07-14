import 'package:duaya_app/features/category/presentation/category/presentation/controller/companies_by_page_cubit.dart';
import 'package:duaya_app/features/flash/presentation/controller/flash_cubit.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../../routing/routes_name.dart';
import '../../../../../home/presentation/widgets/custom_container_product/custom_container_product.dart';

class FlashTodayProductGridView extends StatelessWidget {
  String? companyname;
  FlashTodayProductGridView({super.key, this.companyname});

  @override
  Widget build(BuildContext context) {
    FlashCubit flashTodayController = context.read<FlashCubit>();
    print(companyname);

    if (companyname != null) {
      flashTodayController.fetchCertainCompanyFlashTodayData(
          companyName: companyname!);
      print(flashTodayController.FlashTodayCertainCompany.length);
    }
    return companyname == null
        ? GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.h,
              childAspectRatio: 1 / 2.2,
            ),
            shrinkWrap: true,
            itemCount: flashTodayController.flashTodayModel.data!.length!,
            itemBuilder: (context, index) {
              String image = flashTodayController
                  .flashTodayModel.data![index].thumbnailImage!;
              String ID = flashTodayController.flashTodayModel.data![index].id!
                  .toString();
              String shopName =
                  flashTodayController.flashTodayModel.data![index].shopName!;
              String name =
                  flashTodayController.flashTodayModel.data![index].name!;
              String discount =
                  flashTodayController.flashTodayModel.data![index].discount!;
              String price =
                  flashTodayController.flashTodayModel.data![index].mainPrice!;
              String strokedPrice = flashTodayController
                  .flashTodayModel.data![index].strokedPrice!;
              bool hasDiscount = flashTodayController
                  .flashTodayModel.data![index].hasDiscount!;
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
          )
        : flashTodayController.FlashTodayCertainCompany.length == 0
            ? Center(
                child: Container(
                  child: Text(
                    S.current.noData,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              )
            : GridView.builder(
                // physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 1.2 / 2.2,
                ),
                // shrinkWrap: true,
                itemCount: flashTodayController.FlashTodayCertainCompany.length,
                itemBuilder: (context, index) {
                  String image = flashTodayController
                      .FlashTodayCertainCompany![index].thumbnailImage!;
                  String ID = flashTodayController
                      .FlashTodayCertainCompany![index].id!
                      .toString();
                  String shopName = flashTodayController
                      .FlashTodayCertainCompany![index].shopName!;
                  String name = flashTodayController
                      .FlashTodayCertainCompany![index].name!;
                  String discount = flashTodayController
                      .FlashTodayCertainCompany![index].discount!;
                  String price = flashTodayController
                      .FlashTodayCertainCompany![index].mainPrice!;
                  String strokedPrice = flashTodayController
                      .FlashTodayCertainCompany![index].strokedPrice!;
                  bool hasDiscount = flashTodayController
                      .FlashTodayCertainCompany![index].hasDiscount!;
                  return GestureDetector(
                    onTap: () async {
                      // await bestSellerController.fetchProductData(
                      //     productID: ID);
                      context.pushNamed(DRoutesName.detailsProductRoute,
                          arguments: {
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
