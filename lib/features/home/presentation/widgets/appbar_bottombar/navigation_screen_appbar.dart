import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/cached_image/cached_image.dart';
import '../../../../../routing/routes_name.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../authentication/presentation/controller/auth_controller_cubit.dart';
import '../../../../cart/presentation/widgets/controller/cart_cubit.dart';

class NavigationScreenAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const NavigationScreenAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = context.read<AuthControllerCubit>();
    final cartController = context.read<CartCubit>();
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return DAppBar(
          bgColor: ColorRes.white,
          leadingWidget: GestureDetector(
            onTap: () => context.pushNamed(DRoutesName.settingsRoute),
            child: CachedImage(
                link: authController.userModel.user?.avatarOriginal ?? ""),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(authController.userModel.user!.name!,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 18.sp)),
              Text(authController.userModel.user!.customerType!,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 12.sp))
            ],
          ),
          actions: [
            InkWell(
              onTap: () => context.pushNamed(DRoutesName.giftRoute),
              overlayColor:
                  MaterialStateProperty.all(ColorRes.primary.withOpacity(.1)),
              borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
              child: Container(child: Lottie.asset(AssetRes.gifts)),
            ),
            InkWell(
              onTap: () async {
                context.pushNamed(DRoutesName.CartRoute);
              },
              overlayColor:
                  MaterialStateProperty.all(ColorRes.primary.withOpacity(.1)),
              borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
              child: Stack(children: [
                Container(
                  child: cartController.hasItems
                      ? Lottie.asset(AssetRes.cartAfterFilling)
                      : Lottie.asset(AssetRes.cartBeforeFilling),
                ),
                Container(
                  child: Text(
                    cartController.itemsCount.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                ),
              ]),
            ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DDeviceUtils.getAppBarHeight());
}
