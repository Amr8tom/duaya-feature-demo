import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/cart/presentation/widgets/controller/cart_cubit.dart';
import 'package:duaya_app/features/cart/presentation/widgets/custom_cart_component.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../home/presentation/widgets/custom_container_product/custom_bottom_navigation_in_product.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int count = 0;
  ScrollController scrollController = ScrollController();
  String currentCountry = S.current.loading;

  /// Get Current Country
  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placeMarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      String country = placeMarks.first.country ?? S.current.unknown;
      setState(() => currentCountry = country);
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    final cartController = context.read<CartCubit>();
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: DAppBar(
            leadingWidget: CircleAvatar(
              radius: 50.r,
              backgroundImage: const AssetImage(AssetRes.profileLogo),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.current.appName,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: 18.sp)),
                Text(currentCountry,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 12.sp))
              ],
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(AppSizes.padding),
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      scrollbarTheme: ScrollbarThemeData(
                        thumbColor: MaterialStateProperty.all<Color?>(
                            ColorRes.primary.withOpacity(.8)),
                        trackColor:
                            MaterialStateProperty.all<Color?>(ColorRes.grey3),
                      ),
                    ),
                    child: Scrollbar(
                      controller: scrollController,
                      radius: Radius.circular(AppSizes.borderRadiusMd),
                      thumbVisibility: true,
                      trackVisibility: true,
                      child: ListView.separated(
                        controller: scrollController,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CustomCartComponent(
                            name: cartController.Items[index].productName!,
                            image: cartController
                                .Items[index].productThumbnailImage
                                .toString(),
                            quantity:
                                cartController.Items[index].quantity!.toInt(),
                            price: cartController.Items[index].price.toString(),
                            cartID: cartController.Items[index].id!.toInt(),
                            index: index,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: AppSizes.defaultSpace);
                        },
                        itemCount: cartController.Items.length,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: CustomBottomNavigationInProduct(
                  isCart: true,
                  colorOfButton1: Colors.transparent,
                  colorOfButton2: ColorRes.primary,
                  textOfButton1: S.current.saveChanges,
                  textOfButton2: S.current.checkOut,
                  colorOfBorderOfButton1: ColorRes.primary,
                  colorOfBorderOfButton2: Colors.transparent,
                  textButton1Color: ColorRes.primary,
                  textButton2Color: ColorRes.white,
                  price: cartController.summartTotal,
                  totalText: S.current.total,
                  onTap1: () => cartController.saveQuantitiy(),
                  onTap2: () => cartController.checkOut(
                      userID: cartController.Items![0].userId.toString()),
                )),
              ],
            ),
          ),
        );
      },
    );
  }
}
