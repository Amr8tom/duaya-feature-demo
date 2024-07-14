import 'package:duaya_app/features/search/presentation/controller/search_cubit.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/text_form_field/custom_text_form_field_search.dart';
import '../../../generated/l10n.dart';
import '../../../routing/routes_name.dart';
import '../../../utils/local_storage/cach_keys.dart';
import '../../../utils/local_storage/cache_helper.dart';
import '../../authentication/presentation/controller/auth_controller_cubit.dart';
import '../../home/presentation/widgets/custom_container_product/custom_container_product.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController searchTextController = TextEditingController();

  List<String> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    final searchController = context.read<SearchCubit>();
    final userController = context.read<AuthControllerCubit>();
    final String CityID = userController.userModel.user?.brandId ??
        PrefService.getString(key: CacheKeys.cityID) ??
        "75";
    return WillPopScope(
      onWillPop: () async {
        searchTextController.clear();
        searchController.clearProducts();
        searchController.getProductModel();
        Navigator.pushNamedAndRemoveUntil(
          context,
          DRoutesName.navigationMenuRoute,
          (Route<dynamic> route) => false,
        );
        return false;
      },
      child: Scaffold(
        // appBar: AppBar(
        //   leading: GestureDetector(
        //     onTap: () => Navigator.pushNamedAndRemoveUntil(
        //         context,
        //         DRoutesName.navigationMenuRoute,
        //         (Route<dynamic> route) => false),
        //     child: Icon(
        //       Icons.arrow_forward,
        //       color: ColorRes.white,
        //     ),
        //   ),
        //   title: Text(
        //     S.current.searchTitle,
        //     style: Theme.of(context)
        //         .textTheme
        //         .headlineMedium!
        //         .copyWith(color: ColorRes.white),
        //   ),
        //   centerTitle: true,
        //   actions: [
        //     IconButton(
        //       icon: Icon(
        //         Icons.clear,
        //         color: ColorRes.white,
        //       ),
        //       onPressed: () async {
        //         searchTextController.clear();
        //         searchController.scrollController.addListener(() async {
        //           await searchController.scrollListener(
        //               name: searchTextController.text, cityID: CityID);
        //         });
        //       },
        //     )
        //   ],
        // ),
        appBar: DAppBar(
          leadingWidget: GestureDetector(
            onTap: () async {
              searchTextController.clear();
              searchController.clearProducts();
              Navigator.pushNamedAndRemoveUntil(
                  context,
                  DRoutesName.navigationMenuRoute,
                  (Route<dynamic> route) => false);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: ColorRes.greenBlue,
            ),
          ),
          centerTitle: true,
          title: Text(
            S.current.searchTitle,
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.clear,
                color: ColorRes.greenBlue,
              ),
              onPressed: () async {
                searchTextController.clear();
                searchController.clearProducts();
                searchController.getProductModel();
              },
            )
          ],
        ),
        body: BlocConsumer<SearchCubit, SearchState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            searchController.scrollController.addListener(() async {
              await searchController.scrollListener(
                  name: searchTextController.text, cityID: CityID);
            });
            return Padding(
                padding: EdgeInsets.all(10.sp),
                child: SingleChildScrollView(
                  controller: searchController.scrollController,
                  child: Column(
                    children: [
                      /// search for any product
                      CustomTextFormFieldSearch(
                        hintText: S.current.search,
                        controller: searchTextController,
                        onChange: (String s) async {
                          if (searchTextController.text != "" ||
                              searchTextController.text != " " ||
                              searchTextController.text != "  " ||
                              searchTextController.text.trim() != "" ||
                              searchTextController.text.trim() != null) {
                            searchController.clearProducts();
                            await searchController.fetchSearchData(
                                name: s, cityID: CityID);
                            print(searchController.searchModel.data?[0].name!);
                            // searchModel = searchController.searchModel;
                          } else if (s.trim() == "") {
                            searchController.getProductModel();
                            searchTextController.clear();
                            searchController.clearProducts();
                          }
                          // else {
                          //   searchController.getProductModel();
                          // }
                        },
                        onTapOutside: () async {
                          searchTextController.clear();
                          searchController.clearProducts();
                          searchController.getProductModel();
                        },
                      ),
                      searchController.isSearchData
                          ? GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10.h,
                                childAspectRatio: 1 / 2.1,
                              ),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: searchController.products.length,
                              itemBuilder: (context, index) {
                                if (searchController.products.isEmpty) {
                                  return Container(
                                    padding: EdgeInsets.only(top: 250.h),
                                    child: Text(S.current.noResult),
                                  );
                                }
                                String productName =
                                    searchController.products[index].name!;
                                String productimage = searchController
                                    .products[index].thumbnailImage!;
                                String productprice =
                                    searchController.products[index].mainPrice!;
                                String StrokedPrice = searchController
                                    .products[index].strokedPrice!;
                                bool hasDicount = searchController
                                    .products[index].hasDiscount!;
                                String productCompany =
                                    searchController.products[index].shopName!;
                                String discount =
                                    searchController.products[index].discount!;
                                String ID = searchController.products[index].id!
                                    .toString();
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
                          : Container(
                              padding: EdgeInsets.only(top: 250.h),
                              child: Text(S.current.noResult),
                            )
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }
}
