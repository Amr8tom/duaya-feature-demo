import 'package:duaya_app/features/cart/presentation/widgets/controller/cart_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/constants/colors.dart';
import '../../../home/presentation/widgets/custom_container_product/custom_container_minus_and_plus.dart';

class cartWindows extends StatelessWidget {
  Map? map;
  cartWindows({super.key, this.map});
  @override
  Widget build(BuildContext context) {
    final CartCubit cartController = context.read<CartCubit>();
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.h,
            ),
            cartController.numberOfItems == 0
                ? SizedBox()
                : Container(
                    child: InkWell(
                      child: Container(
                          width: 107.w,
                          height: 38.h,
                          decoration: BoxDecoration(
                              color: ColorRes.greenBlue,
                              borderRadius: BorderRadius.circular(15.r)),
                          child: Center(
                              child: Text(
                            S.current.addToCart,
                            style: TextStyle(
                                color: ColorRes.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16.sp),
                          ))),
                      onTap: () async {
                        cartController.addToCart(
                            id: map!["productID"],
                            quantity: cartController.numberOfItems.toString(),
                            variant: map?["variant"]);
                        cartController.numberOfItems = 0;
                      },
                    ),
                  ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              width: 144.w,
              height: 39.h,
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: ColorRes.greenBlue),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => cartController.addNum(),
                    child: Row(
                      children: [
                        SizedBox(width: 10.sp),
                        Container(
                          height: 50.sp,
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: ColorRes.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 25.sp)
                      ],
                    ),
                  ),
                  CustomContainerMinusAndPlus(
                      widget: Text(
                        "${cartController.numberOfItems}",
                        style: TextStyle(
                            color: ColorRes.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp),
                      ),
                      onTap: () => {},
                      height: 40.sp,
                      borderWidth: 2.w),
                  Spacer(),
                  CustomContainerMinusAndPlus(
                    widget: Icon(
                      Iconsax.minus,
                      color: ColorRes.white,
                    ),
                    onTap: () => cartController.minusNum(),
                    height: 40.sp,
                    borderWidth: 2.w,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
