import 'package:duaya_app/features/cart/presentation/widgets/controller/cart_cubit.dart';
import 'package:duaya_app/features/home/presentation/widgets/custom_container_product/custom_container_minus_and_plus.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/constants.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CustomCartComponent extends StatefulWidget {
  String name, image, price, company, round;
  int quantity;
  int index;
  int cartID;
  CustomCartComponent({
    super.key,
    required this.round,
    required this.name,
    required this.company,
    required this.index,
    required this.image,
    required this.price,
    required this.quantity,
    required this.cartID,
  });

  @override
  State<CustomCartComponent> createState() => _CustomCartComponentState();
}

class _CustomCartComponentState extends State<CustomCartComponent> {
  @override
  Widget build(BuildContext context) {
    CartCubit cartController = context.read<CartCubit>();

    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        double removeFractions =
            (cartController.Items![widget.index].quantity!) *
                double.parse(widget.price);
        return Card(
            elevation: 5,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    // color: ColorRes.grey,
                    color: ColorRes.greenBlueLight.withOpacity(0.6),
                    borderRadius:
                        BorderRadius.circular(AppSizes.borderRadiusLg),
                  ),
                  child: Row(
                    children: [
                      /// Product Image
                      Image.network(widget.image,
                          height: AppSizes.imageSize * 2.6),

                      /// Product Info
                      Expanded(
                        flex: 8,
                        child: Padding(
                          padding: EdgeInsets.all(AppSizes.spaceBetweenIcon),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// name
                              Text(
                                widget.name,
                                style: Theme.of(context).textTheme.bodySmall!,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: AppSizes.spaceBtwTexts * 2),

                              /// company
                              Text(
                                widget.company,
                                style: Theme.of(context).textTheme.bodySmall!,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: AppSizes.spaceBtwTexts * 2),

                              /// round
                              Text(
                                widget.round,
                                style: Theme.of(context).textTheme.bodySmall!,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: AppSizes.spaceBtwTexts * 2),

                              /// Price
                              Text(
                                "${removeFractions.toStringAsFixed(2)}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        color: ColorRes.error2,
                                        fontSize: 14.sp),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Add Spacer to push elements to the end
                      // IconButton(
                      //     onPressed: () async {
                      //       await cartController.deleteCart(cartID: widget.cartID);
                      //       cartController.Items.removeAt(widget.index);
                      //       cartController.calaTotal();
                      //       cartController.fetchCartItems();
                      //     },
                      //     icon: Image.asset(AssetRes.removeIcon, height: 22.h)),

                      /// Add And Minus
                      Flexible(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomContainerMinusAndPlus(
                              widget: Icon(
                                Iconsax.minus,
                                color: ColorRes.blueColor,
                              ),
                              onTap: () {
                                if (cartController
                                        .Items![widget.index].quantity!
                                        .toInt() >
                                    1) {
                                  cartController.updateQuantitiy(
                                      index: widget.index, isAdd: false);
                                }
                              },
                              height: 20.sp,
                              borderWidth: 2.w,
                            ),
                            SizedBox(height: AppSizes.defaultSpace / 4.5),
                            Padding(
                              padding: EdgeInsets.all(10.sp),
                              child: Text(
                                widget.quantity.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      color: ColorRes.error2,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.sp,
                                    ),
                              ),
                            ),
                            SizedBox(height: AppSizes.defaultSpace / 4.5),
                            CustomContainerMinusAndPlus(
                              widget: Icon(
                                Iconsax.add,
                                color: ColorRes.blueColor,
                              ),
                              onTap: () {
                                cartController.updateQuantitiy(
                                    index: widget.index, isAdd: true);
                              },
                              height: 20.sp,
                              borderWidth: 2.w,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 60.w,
                  bottom: 0,
                  child: IconButton(
                      onPressed: () async {
                        await cartController.deleteCart(cartID: widget.cartID);
                        cartController.Items.removeAt(widget.index);
                        cartController.calaTotal();
                        cartController.fetchCartItems();
                      },
                      icon: Image.asset(AssetRes.removeIcon, height: 22.h)),
                )
              ],
            ));
      },
    );
  }
}
