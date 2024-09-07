import 'dart:async';
import 'package:duaya_app/common/custom_ui.dart';
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
import '../../home/presentation/widgets/custom_container_product/custom_container_product.dart';

class SearchScreen extends StatelessWidget {
  String? companyID;
  String? companyName;
  TextEditingController searchTextController = TextEditingController();

  SearchScreen({this.companyName, this.companyID});

  @override
  Widget build(BuildContext context) {
    final searchController = context.read<SearchCubit>();
    searchController.turnOff();

    /// remove old results
    return Scaffold(
      appBar: DAppBar(
        showBackArrow: true,
        centerTitle: true,
        title: companyName == null
            ? Text(
                S.current.searchTitle,
              )
            : Text(
                "$companyName",
                style: TextStyle(fontSize: 20.sp),
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
              searchController.turnOff();
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
                name: searchTextController.text, companyID: companyID);
          });
          return Padding(
              padding: EdgeInsets.all(10.sp),
              child: SingleChildScrollView(
                controller: searchController.scrollController,

                /// search for any product
                child: Column(
                  children: [
                    CustomTextFormFieldSearch(
                      hintText: S.current.search,
                      controller: searchTextController,
                      onChange: (String s) async {
                        if (searchController.active) {
                        } else {
                          searchController.active = true;
                          Future.delayed(Duration(milliseconds: 2000),
                              () async {
                            if (searchTextController.text != "" &&
                                searchTextController.text != " " &&
                                searchTextController.text != null &&
                                searchTextController.text != "  " &&
                                searchTextController.text.trim() != "" &&
                                searchTextController.text.trim() != null) {
                              await searchController.clearProducts();
                              await searchController.fetchSearchData(
                                companyID: companyID,
                                name: searchTextController.text,
                              );
                            } else if (searchTextController.text == "" ||
                                searchTextController.text == " " ||
                                searchTextController.text == "  " ||
                                searchTextController.text == null ||
                                searchTextController.text.isEmpty) {
                              searchController.turnOff();
                              searchTextController.clear();
                              searchController.clearProducts();
                            }
                            searchController.active = false;
                          });
                        }
                      },
                      onTapOutside: () async {
                        searchTextController.clear();
                        searchController.clearProducts();
                        await searchController.turnOff();
                      },
                    ),
                    searchController.isSearchData
                        ? searchController.active
                            ? CustomUI.searchWidget()
                            : GridView.builder(
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
                                  String productprice = searchController
                                      .products[index].mainPrice!;
                                  String StrokedPrice = searchController
                                      .products[index].strokedPrice!;
                                  bool hasDicount = searchController
                                      .products[index].hasDiscount!;
                                  String productCompany = searchController
                                      .products[index].shopName!;
                                  String discount = searchController
                                      .products[index].discount!;
                                  String ID = searchController
                                      .products[index].id!
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
    );
  }
}
