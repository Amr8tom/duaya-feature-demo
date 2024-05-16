import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/home/presentation/widgets/custom_container_product/banner_varient_product_details.dart';
import 'package:duaya_app/features/home/presentation/widgets/custom_container_product/cart_windows.dart';
import 'package:duaya_app/features/home/presentation/widgets/custom_container_product/custom_container_minus_and_plus.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/custom_container_product/banner_product_details.dart';

class DetailsProduct extends StatefulWidget {
  final Map<String, dynamic> map;
  DetailsProduct({Key? key, required this.map}) : super(key: key);

  @override
  State<DetailsProduct> createState() => _DetailsProductState();
}

class _DetailsProductState extends State<DetailsProduct> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DAppBar(
        title: Text(widget.map["productName"],
            style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
        showBackArrow: true,
        // leadingWidget: const Icon(Icons.arrow_back_ios),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 350.sp,
              decoration: BoxDecoration(
                  color: ColorRes.grey.withOpacity(0.7),
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(300))),
              child: SizedBox(),
            ),
          ),
          BannerInVarientProduct(map: widget.map),
          // CustomContainerBannerInDetailsProduct(map: widget.map),

          Column(
            children: [
              Spacer(),
              cartWindows(map: widget.map),
              SizedBox(
                height: 20.sp,
              )
            ],
          ),
        ],
      ),

      // ),
    );
  }
}
