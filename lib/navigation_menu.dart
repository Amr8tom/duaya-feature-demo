import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:duaya_app/common/check_for_updates.dart';
import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/common/widgets/cached_image/cached_image.dart';
import 'package:duaya_app/features/cart/presentation/widgets/controller/cart_cubit.dart';
import 'package:duaya_app/features/category/presentation/category/category_screen.dart';
import 'package:duaya_app/features/category/presentation/company/companyScreen.dart';
import 'package:duaya_app/features/flash/presentation/flash_screen.dart';
import 'package:duaya_app/features/home/presentation/home_screen.dart';
import 'package:duaya_app/features/settings/presentation/controller/translation_cubit.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/helper_functions.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'common/exit_app_function_dialoag.dart';
import 'common/managers/navigation_menu/navigation_menu_cubit.dart';
import 'common/text_record_function.dart';
import 'features/authentication/presentation/controller/auth_controller_cubit.dart';
import 'features/category/presentation/category/presentation/controller/categories_by_page_cubit.dart';
import 'features/category/presentation/category/presentation/controller/companies_by_page_cubit.dart';
import 'features/flash/presentation/controller/flash_cubit.dart';
import 'features/home/presentation/controller/best_seller_cubit.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'features/services/presentation/medical_service/presentation/controller/medical_services_cubit.dart';
import 'features/services/presentation/services_screen.dart';
import 'generated/l10n.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({Key? key});
  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  String currentCountry = S.current.loading;
  Offset _fabOffset = Offset(85.w, 110.h); // Initial position of the FAB
  CheckForeUpdates updateCode = CheckForeUpdates();
  @override
  void initState() {
    super.initState();
    fetchData();
    fetchNavigationsData();
    updateCode.makeUpdate();
    speak(locale: S.current.localeee, statements: S.current.welcomeMessage);
  }

  Future<void> fetchData() async {
    await context
        .read<CategoriesByPageCubit>()
        .fetchCategoriesByPage(userID: 0);
    try {
      if (context.read<FlashCubit>().flashTodayModel.data!.isEmpty) {
        await context.read<FlashCubit>().fetchFlashTodayData();
      }
    } catch (e) {}
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
                /// AppBar in All Screens
                appBar: DAppBar(
                  bgColor: ColorRes.white,
                  leadingWidget: GestureDetector(
                    onTap: () => context.pushNamed(DRoutesName.settingsRoute),
                    child: CachedImage(
                        link: authController.userModel.user?.avatarOriginal ??
                            ""),
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
                      overlayColor: MaterialStateProperty.all(
                          ColorRes.primary.withOpacity(.1)),
                      borderRadius:
                          BorderRadius.circular(AppSizes.borderRadiusMd),
                      child: Container(child: Lottie.asset(AssetRes.gifts)),
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
                        Container(
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
                        ),
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
                        icon: Icon(Iconsax.shop), label: S.current.company),
                    BottomNavigationBarItem(
                        icon: Icon(Iconsax.timer), label: S.current.flashSale),
                    BottomNavigationBarItem(
                        icon: Icon(Iconsax.setting_2),
                        label: S.current.services),
                  ],
                ),
                // floatingActionButton: FloatingButton(),
                // floatingActionButtonLocation:
                //     FloatingActionButtonLocation.centerDocked,
                // bottomNavigationBar: AnimatedBottomNavigationBar.builder(
                //   itemCount: 4,
                //   height: kToolbarHeight * .9,
                //   gapLocation: GapLocation.center,
                //   notchSmoothness: NotchSmoothness.verySmoothEdge,
                //   // tabBuilder: (int index, bool isActive) {
                //   //   return _items[index];
                //   // },
                //   activeIndex: 2,
                //   onTap: (int) {},
                // ),

                body: _buildScreen(selectedIndex),
                floatingActionButton: Stack(
                  children: [
                    Positioned(
                      left: _fabOffset.dx,
                      top: _fabOffset.dy,
                      child: Draggable<Offset>(
                        data: _fabOffset,
                        feedback: Material(
                          borderRadius: BorderRadius.circular(20.sp),
                          color: ColorRes.lightGreen,
                          child: Lottie.asset(AssetRes.searchICon, height: 60),
                        ),
                        childWhenDragging: Container(),
                        onDraggableCanceled: (velocity, offset) {
                          setState(() {
                            _fabOffset = offset;
                          });
                        },
                        onDragEnd: (details) {
                          setState(() {
                            _fabOffset = details.offset;
                          });
                        },
                        child: RawMaterialButton(
                          onPressed: () {
                            context.pushNamed(DRoutesName.searchRoute);
                          },
                          child:
                              Lottie.asset(AssetRes.searchICon, height: 105.sp),
                        ),
                      ),
                    ),
                  ],
                ),
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
        return const CompanyScreen();
      case 2:
        return const FlashScreen();
      case 3:
        return const ServicesScreen();
      default:
        return Container();
    }
  }

  Future<void> fetchNavigationsData() async {
    try {
      await context
          .read<CompaniesByPageCubit>()
          .fetchCompaniesByPageRepositories();
    } catch (e) {
      print(e);
    }
    try {
      await context.read<FlashCubit>().fetchFlashData();
    } catch (e) {
      print(e);
    }
    try {
      if (context.read<BestSellerCubit>().productModel.data?.length == 0) {
        await context.read<BestSellerCubit>().fetchBestSellerData();
      }
    } catch (e) {
      print(e);
    }
  }

  List _items = [
    Icon(Iconsax.home),
    Icon(Iconsax.home),
    Icon(Iconsax.home),
    Icon(Iconsax.home),
  ];
}
