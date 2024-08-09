import 'package:duaya_app/common/check_for_updates.dart';
import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/common/widgets/cached_image/cached_image.dart';
import 'package:duaya_app/features/cart/presentation/widgets/controller/cart_cubit.dart';
import 'package:duaya_app/features/category/presentation/company/companyScreen.dart';
import 'package:duaya_app/features/flash/presentation/flash_screen.dart';
import 'package:duaya_app/features/home/presentation/home_screen.dart';
import 'package:duaya_app/features/home/presentation/widgets/custom_lottie_floating_avtion_bottom.dart';
import 'package:duaya_app/features/settings/presentation/controller/translation_cubit.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/connection/check_for_updates.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/helper_functions.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../common/exit_app_function_dialoag.dart';
import '../../../common/managers/navigation_menu/navigation_menu_cubit.dart';
import '../../../common/widgets/navigationbar/bottom_navigation_bar.dart';
import '../../authentication/presentation/controller/auth_controller_cubit.dart';
import '../../category/presentation/category/presentation/controller/categories_by_page_cubit.dart';
import '../../category/presentation/category/presentation/controller/companies_by_page_cubit.dart';
import '../../flash/presentation/controller/flash_cubit.dart';
import 'controller/best_seller_cubit.dart';
import '../../services/medical_service/presentation/controller/medical_services_cubit.dart';
import '../../services/presentation/services_screen.dart';
import '../../../generated/l10n.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({Key? key});
  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  String currentCountry = S.current.loading;

  CheckForeUpdates updateCode = CheckForeUpdates();
  @override
  void initState() {
    super.initState();
    fetchData();
    fetchNavigationsData();
    checkForUpdate(context: context);
    updateCode.makeUpdate();
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
                          // await cartController.fetchCartItems();
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
                  bottomNavigationBar: const CustomBottomNavigationBar(),
                  body: RefreshIndicator(
                      displacement: 500,
                      color: ColorRes.greenBlue,
                      backgroundColor: Colors.white,
                      strokeWidth: 4,
                      onRefresh: () async {
                        await fetchData();
                        await fetchNavigationsData();
                        await context
                            .read<BestSellerCubit>()
                            .fetchBestSellerData();
                        await checkForUpdate(context: context);
                        await updateCode.makeUpdate();
                      },
                      child: _buildScreen(selectedIndex)),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                  floatingActionButton:
                      const CustomLottieFloatingAvtionBottom()),
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
}
