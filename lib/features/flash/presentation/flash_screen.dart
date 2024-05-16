import 'package:duaya_app/features/flash/presentation/controller/flash_cubit.dart';
import 'package:duaya_app/features/home/presentation/widgets/custom_container_product/custom_container_product.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import 'widgets/custom_time_left_in_flash_sale.dart';

class FlashScreen extends StatelessWidget {
  const FlashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final flashController = context.read<FlashCubit>();
    return BlocConsumer<FlashCubit, FlashState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is FlashSuccessState) {
          print("heeeeeeeeeeeeeeey");
          return SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.all(AppSizes.padding),
            child: Column(
              children: [
                /// Make Space
                SizedBox(height: AppSizes.spaceBtwItems),

                const CustomTimeLeftInFlashSale(),

                /// Make Space
                SizedBox(height: AppSizes.spaceBtwItems * 3),

                /// Products
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.h,
                    childAspectRatio: 1 / 2.2,
                  ),
                  shrinkWrap: true,
                  itemCount: flashController
                      .flashModel.data![0].products!.data2!.length,
                  itemBuilder: (context, index) {
                    String image = flashController
                        .flashModel.data![0].products!.data2![index].image!;
                    String name = flashController
                        .flashModel.data![0].products!.data2![index].name!;
                    String price = flashController
                        .flashModel.data![0].products!.data2![index].price!;
                    String shope = flashController.flashModel.data![0].title!;
                    return GestureDetector(
                      onTap: () =>
                          context.pushNamed(DRoutesName.detailsProductRoute),
                      child: CustomContainerProduct(
                          hasDicount: false,
                          productImage: image,
                          productName: name,
                          price: price,
                          companyName: shope,
                          rete: 4.5),
                    );
                  },
                ),
              ],
            ),
          ));
        } else {
          print("heeeeeeeeeeeeeeey");
          return Center(
            child: Lottie.asset(AssetRes.circleLoading),
          );
        }
      },
    );
  }
}
