import 'package:duaya_app/features/cart/presentation/widgets/controller/cart_cubit.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/common_snak_bar_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/constants/sizes.dart';

class AddMinusCartButton extends StatefulWidget {
  int quantitiy = 0;
  String ID;
  bool isAddedOrinitial = true;
  double? width = 300.w;
  double? height = AppSizes.imageSize / 1.6;
  final Color? color;
  final Color borderColor, textButtonColor;

  AddMinusCartButton({
    Key? key,
    this.width,
    this.height,
    this.color,
    required this.borderColor,
    required this.ID,
    required this.textButtonColor,
  }) : super(key: key);

  @override
  State<AddMinusCartButton> createState() => _AddMinusCartButtonState();
}

class _AddMinusCartButtonState extends State<AddMinusCartButton> {
  @override
  Widget build(BuildContext context) {
    CartCubit CartController = context.read<CartCubit>();
    return Column(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              if ((widget.quantitiy == 0)) {
                commonToast("${S.current.selectQuantitiy}");
              } else {
                widget.isAddedOrinitial = true;
                CartController.addToCart(
                    id: widget.ID, quantity: widget.quantitiy.toString());
                CartController.fetchCartData();
              }
            });
          },
          icon: widget.quantitiy > 0
              ? Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      color: Colors.red),
                  width: widget.width,
                  height: 30.sp,
                  child: Center(
                    child: Text(
                      "${S.current.addToCart}",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            height: .5.h,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis,
                          ),
                    ),
                  ),
                )
              : SizedBox(),
        ),
        Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: widget.isAddedOrinitial
                  ? widget.color
                  : widget.color!.withOpacity(0.4),
              border: Border.all(color: widget.borderColor),
              borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg * 2),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          widget.quantitiy++;
                          widget.isAddedOrinitial = false;
                        });
                      },
                      icon: CircleAvatar(
                        radius: 17,
                        backgroundColor: ColorRes.greenBlue,
                        child: Icon(
                          Icons.add,
                          color: ColorRes.white,
                        ),
                      )),
                  Spacer(),
                  Text(
                    widget.quantitiy.toString(),
                    style: TextStyle(
                        color: ColorRes.greenBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (widget.quantitiy > 1) {
                              widget.quantitiy--;
                              widget.isAddedOrinitial = false;
                            } else if (widget.quantitiy == 1) {
                              widget.quantitiy--;
                              widget.isAddedOrinitial = true;
                            }
                          });
                        },
                        iconSize: 10,
                        icon: CircleAvatar(
                          radius: 17,
                          backgroundColor: ColorRes.greenBlue,
                          child: Container(
                            color: ColorRes.white,
                            width: 15,
                            height: 3,
                          ),
                        ),
                      ),
                      Spacer()
                    ],
                  ),
                  // SizedBox(width: AppSizes.spaceBtwTexts),
                  // SizedBox(child: widget)
                ],
              ),
            )),
      ],
    );
  }
}
