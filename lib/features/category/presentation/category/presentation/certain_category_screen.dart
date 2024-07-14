import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/authentication/presentation/controller/auth_controller_cubit.dart';
import 'package:duaya_app/features/search/data/model/SearchModel.dart';
import 'package:duaya_app/features/category/data/model/SingleCategoryModel.dart';
import 'package:duaya_app/features/category/presentation/category/presentation/controller/categories_by_page_cubit.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/text_form_field/custom_text_form_field_search.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../routing/routes_name.dart';
import '../../../../home/presentation/widgets/custom_container_product/custom_container_product.dart';
import '../../../../search/presentation/controller/search_cubit.dart';

class certainCategoryScreen extends StatelessWidget {
  TextEditingController searchTextController = TextEditingController();
  Map<String, dynamic> map;
  certainCategoryScreen({super.key, required this.map});
  @override
  Widget build(BuildContext context) {
    final searchController = context.read<SearchCubit>();
    CategoriesByPageCubit certainCataController =
        context.read<CategoriesByPageCubit>();
    final userController = context.read<AuthControllerCubit>();
    SingleCategoryModel productModel = certainCataController.singleCata;
    late SearchModel searchModel;
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final String CityID = userController.userModel.user!.brandId ?? "75";
        searchController.scrollController.addListener(() async {
          await searchController.scrollListener(
              name: searchTextController.text, cityID: CityID);
        });

        return Scaffold(
          backgroundColor: ColorRes.borderPrimary,
          appBar: DAppBar(
            showBackArrow: true,
            leadingWidget: Icon(Icons.arrow_back_ios),
            centerTitle: true,
            title: Text(map["cataName"]),
          ),
          body: SingleChildScrollView(
            controller: searchController.scrollController,
            child: Column(
              children: [
                CustomTextFormFieldSearch(
                    hintText: S.current.search,
                    controller: searchTextController,
                    onChange: (String s) async {
                      if (searchTextController.text != "") {
                        searchController.clearProducts();
                        await searchController.fetchSearchData(
                            name: s, cityID: CityID);
                        print(searchController.searchModel.data![0].name!);
                        // searchModel = searchController.searchModel;
                      } else {
                        searchController.getProductModel();
                      }
                    }),
                searchController.isSearchData
                    ? GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.h,
                          childAspectRatio: 1 / 2.2,
                        ),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: searchController.products.length,
                        itemBuilder: (context, index) {
                          String productName =
                              searchController.products[index].name!;
                          String productimage =
                              searchController.products[index].thumbnailImage!;
                          String productprice =
                              searchController.products[index].mainPrice!;
                          String StrokedPrice =
                              searchController.products[index].strokedPrice!;
                          bool hasDicount =
                              searchController.products[index].hasDiscount!;
                          String productCompany =
                              searchController.products[index].shopName!;
                          String discount =
                              searchController.products[index].discount!;
                          String ID =
                              searchController.products[index].id!.toString();
                          return GestureDetector(
                            onTap: () async {
                              context.pushNamed(DRoutesName.detailsProductRoute,
                                  arguments: {
                                    "productName": productName,
                                    "productID": ID,
                                    "discount": discount,
                                    "productImage": productimage,
                                    "companyName": productCompany,
                                    "discount": discount,
                                    "price": productprice,
                                    "strockedPrice": StrokedPrice,
                                    "hasDicount": hasDicount,
                                  });
                            },
                            child: CustomContainerProduct(
                              productImage: productimage,
                              productName: productName,
                              companyName: productCompany,
                              discount: discount,
                              rete: 4.5,
                              price: productprice,
                              hasDicount: hasDicount,
                              strockedPrice: StrokedPrice,
                              productID: ID,
                            ),
                          );
                        })
                    : productModel.data!.length != 0
                        ? GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10.h,
                              childAspectRatio: 1 / 2.2,
                            ),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: productModel.data!.length,
                            itemBuilder: (context, index) {
                              if (productModel.data?.length != 0) {
                                String productName =
                                    productModel.data![index].name!;
                                String productimage =
                                    productModel.data![index].thumbnailImage!;
                                String productprice =
                                    productModel.data![index].mainPrice!;
                                String StrokedPrice =
                                    productModel.data![index].strokedPrice!;
                                bool hasDicount =
                                    productModel.data![index].hasDiscount!;
                                String productCompany =
                                    productModel.data![index].shopName!;
                                String discount =
                                    productModel.data![index].discount!;
                                String ID =
                                    productModel.data![index].id!.toString();
                                return GestureDetector(
                                  onTap: () async {
                                    context.pushNamed(
                                        DRoutesName.detailsProductRoute,
                                        arguments: {
                                          "productName": productName,
                                          "productID": ID,
                                          "discount": discount,
                                          "productImage": productimage,
                                          "companyName": productCompany,
                                          "discount": discount,
                                          "price": productprice,
                                          "strockedPrice": StrokedPrice,
                                          "hasDicount": hasDicount,
                                        });
                                  },
                                  child: CustomContainerProduct(
                                    productID: ID,
                                    productImage: productimage,
                                    productName: productName,
                                    companyName: productCompany,
                                    discount: discount,
                                    rete: 4.5,
                                    price: productprice,
                                    hasDicount: hasDicount,
                                    strockedPrice: StrokedPrice,
                                  ),
                                );
                              } else {
                                return Text(S.current.noData);
                              }
                            })
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: AppSizes.productItemHeight * 2,
                              ),
                              Text(
                                S.current.noData,
                                style: TextStyle(color: ColorRes.greenBlue),
                              ),
                            ],
                          )
              ],
            ),
          ),
        );
      },
    );
  }
}
