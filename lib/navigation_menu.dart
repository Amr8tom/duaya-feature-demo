import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/cart/presentation/widgets/controller/cart_cubit.dart';
import 'package:duaya_app/features/category/presentation/category/category_screen.dart';
import 'package:duaya_app/features/category/presentation/company/companyScreen.dart';
import 'package:duaya_app/features/flash/presentation/flash_screen.dart';
import 'package:duaya_app/features/home/presentation/home_screen.dart';
import 'package:duaya_app/features/menu/presentation/medical_service/presentation/controller/medical_services_cubit.dart';
import 'package:duaya_app/features/menu/presentation/menu_screen.dart';
import 'package:duaya_app/features/settings/presentation/controller/translation_cubit.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/helper_functions.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'common/exit_app_function_dialoag.dart';
import 'common/managers/navigation_menu/navigation_menu_cubit.dart';
import 'common/text_record_function.dart';
import 'features/authentication/presentation/controller/auth_controller_cubit.dart';
import 'features/flash/presentation/controller/flash_cubit.dart';
import 'generated/l10n.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({Key? key});
  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  String currentCountry = S.current.loading;

  @override
  void initState() {
    super.initState();
    fetchData();
    speak(locale: S.current.localeee, statements: S.current.welcomeMessage);
  }

  Future<void> fetchData() async {
    await context.read<FlashCubit>().fetchFlashTodayData();
    await context.read<SettinglationCubit>().fetchProfileData();
    await context.read<CartCubit>()
      ..fetchCartItems();
    await context.read<MedicalServicesCubit>()
      ..fetchMedicalServicesList();
  }

  @override
  Widget build(BuildContext context) {
    final navController = context.read<NavigationMenuCubit>();
    final authController = context.read<AuthControllerCubit>();
    final cartController = context.read<CartCubit>();
    final darkMode = DHelperFunctions.isDarkMode(context);

    return BlocBuilder<NavigationMenuCubit, int>(
      builder: (context, selectedIndex) {
        return BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return WillPopScope(
              onWillPop: () async {
                return await showExitConfirmationDialog(context: context) ??
                    false;
              },
              child: Scaffold(
                appBar: selectedIndex == 3

                    /// Flash AppBar
                    ? DAppBar(
                        // bgColor: ColorRes.white.withOpacity(0.8),
                        // showBAackGroundColor: true,
                        // centerTitle: true,
                        //
                        // /// sale Icon
                        // leadingWidget: IconButton(
                        //     onPressed: () {},
                        //     icon: const Icon(Icons.local_offer_rounded,
                        //         color: ColorRes.gold)),
                        //
                        // /// Flash Title
                        title: Text(S.current.appName,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontSize: 30.sp,
                                    color: ColorRes.lightGreen)),
                        centerTitle: true,

                        /// Search Icon
                        // actions: [
                        //   IconButton(
                        //       onPressed: () {},
                        //       icon: const Icon(Iconsax.search_normal,
                        //           color: ColorRes.gold))
                        // ],
                      )

                    /// AppBar in All Screens
                    : DAppBar(
                        leadingWidget: GestureDetector(
                          onTap: () =>
                              context.pushNamed(DRoutesName.settingsRoute),
                          child: CircleAvatar(
                            radius: 50.r,
                            backgroundImage: Image.network(authController
                                    .userModel.user!.avatarOriginal!)
                                .image,
                          ),
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
                          /// Gift Icon
                          InkWell(
                            onTap: () =>
                                context.pushNamed(DRoutesName.giftRoute),
                            overlayColor: MaterialStateProperty.all(
                                ColorRes.primary.withOpacity(.1)),
                            borderRadius:
                                BorderRadius.circular(AppSizes.borderRadiusMd),
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Lottie.asset(AssetRes.gifts)),
                          ),
                          InkWell(
                            onTap: () async {
                              context.pushNamed(DRoutesName.CartRoute);
                              await cartController.fetchCartItems();
                            },
                            overlayColor: MaterialStateProperty.all(
                                ColorRes.primary.withOpacity(.1)),
                            borderRadius:
                                BorderRadius.circular(AppSizes.borderRadiusMd),
                            child: Stack(children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 0.w),
                                child: cartController.hasItems
                                    ? Lottie.asset(AssetRes.cartAfterFilling)
                                    : Lottie.asset(AssetRes.cartBeforeFilling),
                              ),
                              Container(
                                child: Text(
                                  cartController.itemsCount.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ),
                              )
                            ]),
                          ),
                        ],
                      ),
                bottomNavigationBar: BottomNavigationBar(
                  elevation: 0,
                  currentIndex: navController.indx,
                  onTap: (index) => navController.setSelectedIndex(index),
                  backgroundColor: Colors.amber,
                  showUnselectedLabels: true,
                  unselectedItemColor: ColorRes.silver,
                  selectedItemColor: darkMode
                      ? ColorRes.primaryDark.withOpacity(0.9)
                      : ColorRes.lightGreen,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Iconsax.home), label: S.current.home),
                    BottomNavigationBarItem(
                        icon: Center(
                          child: Icon(
                            Iconsax.category_25,
                          ),
                        ),
                        label: S.current.category),
                    BottomNavigationBarItem(
                        icon: Icon(Iconsax.shop), label: S.current.company),
                    BottomNavigationBarItem(
                        icon: Icon(Iconsax.timer), label: S.current.flashSale),
                    BottomNavigationBarItem(
                        icon: Icon(Iconsax.setting_2), label: S.current.menu),
                  ],
                ),
                body: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 700),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: _buildScreen(selectedIndex),
                ),
                // floatingActionButton: selectedIndex == 4
                //     ? FloatingActionButton(onPressed: () {})
                //     : SizedBox(),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildScreen(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return CategoryScreen();
      case 2:
        return const CompanyScreen();
      case 3:
        return const FlashScreen();
      case 4:
        return const MenuScreen();
      default:
        return Container();
    }
  }
}
