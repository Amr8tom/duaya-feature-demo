import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/home/presentation/controller/best_seller_cubit.dart';
import 'package:duaya_app/features/home/presentation/widgets/custom_container_product/banner_varient_product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    BestSellerCubit bestSellerController = context.read<BestSellerCubit>();
    bestSellerController.clearData();
    bestSellerController.fetchProductData(productID: widget.map["productID"]);
    bestSellerController.fetchRelatedProductData(
        productID: widget.map["productID"]);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DAppBar(
        title: Text(widget.map["productName"],
            style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: BannerInVarientProduct(map: widget.map),
        ),
      ),

      // ),
    );
  }
}
