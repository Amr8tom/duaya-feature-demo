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
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: Container(
            decoration: BoxDecoration(
                color: ColorRes.lightGreen,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1.sp, color: ColorRes.white)),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: 20.sp,
                ),
                CustomContainerMinusAndPlus(
                    widget: Text("${cartController.numberOfItems}",
                        style: TextStyle(
                            color: ColorRes.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
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
                    borderWidth: 2.w),
                Spacer(),
                CustomContainerMinusAndPlus(
                    widget: Text(S.current.addToCart,
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: ColorRes.white,
                        )),
                    onTap: () => {
                          cartController.addToCart(
                              id: map!["productID"],
                              quantity: cartController.numberOfItems.toString(),
                              variant: map?["variant"])
                        },
                    height: 40.sp,
                    borderWidth: 2.w),
                Spacer(),
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
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
