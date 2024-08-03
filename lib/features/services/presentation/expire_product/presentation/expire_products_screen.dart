import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/common/widgets/floating_action_button/custom_floating_action_button.dart';
import 'package:duaya_app/features/home/presentation/widgets/custom_container_product/custom_container_product.dart';
import 'package:duaya_app/features/services/presentation/expire_product/presentation/controller/expired_products_cubit.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpireProductsScreen extends StatelessWidget {
  String? productID;
  ExpireProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpiredProductsCubit()..fetchExpiredListData(),
      child: BlocConsumer<ExpiredProductsCubit, ExpiredProductsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final expiredController = context.read<ExpiredProductsCubit>();
          return Scaffold(
            appBar: DAppBar(
              title: Text(S.current.expiredProduct),
              centerTitle: true,
              showBackArrow: true,
            ),
            body: (state is! ExpiredProductsListLoading &&
                    expiredController.expiredListModel.data?.length != 0)
                ? Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: AppSizes.spaceBtwItems),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.h,
                        childAspectRatio: 1.1 / 2,
                      ),
                      shrinkWrap: true,
                      itemCount:
                          expiredController.expiredListModel.data!.length,
                      itemBuilder: (context, index) {
                        final name = expiredController
                            .expiredListModel.data![index].name;
                        final thumbnailImage = expiredController
                            .expiredListModel.data![index].thumbnailImage;
                        final unitPrice = expiredController
                            .expiredListModel.data![index].unitPrice;
                        final approved = expiredController
                            .expiredListModel.data![index].approved;
                        final currentStock = expiredController
                            .expiredListModel.data![index].currentStock;
                        final expiredDate = expiredController
                            .expiredListModel.data![index].expiredDate;
                        final ID =
                            expiredController.expiredListModel.data![index].id;
                        return GestureDetector(
                            onTap: () {
                              context
                                  .pushNamed(DRoutesName.detailsProductRoute);
                            },
                            child: Stack(
                              children: [
                                CustomContainerProduct(
                                  productImage: AssetRes.product,
                                  productName: name!,
                                  hight: 170.sp,
                                  price: unitPrice!,
                                  isCart: false,
                                  removeDiscount: true,
                                  strockedPrice: expiredDate!,
                                  hasDicount: true,
                                  discount: approved!
                                      ? S.current.accepted
                                      : S.current.refused,
                                  companyName:
                                      "${S.current.quantity} : ${currentStock.toString()}",
                                  rete: 4.5,
                                  productID: ID.toString(),
                                ),

                                /// update the product button
                                Column(
                                  children: [
                                    Spacer(),
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () async {
                                              productID = ID.toString();
                                              context.pushNamed(
                                                DRoutesName.addNewProductRoute,
                                                arguments: {
                                                  "isUpdate": true,
                                                  "ID": productID
                                                },
                                              );
                                            },
                                            icon: Icon(
                                              Icons.edit,
                                              size: 30,
                                              color: Colors.black,
                                            )),
                                        Spacer(),
                                        IconButton(
                                            onPressed: () async {
                                              await expiredController
                                                  .fetchDeleteExpiredProduct(
                                                      ID: ID.toString());
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              size: 35,
                                              color: Colors.black,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ));
                      },
                    ),
                  )
                : SizedBox(),
            floatingActionButton: CustomFloatingActionButton(
                color: ColorRes.black,
                textButton: S.current.newProduct,
                onPressed: () => context.pushNamed(
                    DRoutesName.addNewProductRoute,
                    arguments: {"isUpdate": false, "ID": productID})),
          );
        },
      ),
    );
  }
}
