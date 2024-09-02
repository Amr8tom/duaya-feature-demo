import 'package:duaya_app/common/check_for_updates.dart';
import 'package:duaya_app/features/cart/presentation/widgets/controller/cart_cubit.dart';
import 'package:duaya_app/features/category/presentation/company/companyScreen.dart';
import 'package:duaya_app/features/flash/presentation/flash_screen.dart';
import 'package:duaya_app/features/home/presentation/home_screen.dart';
import 'package:duaya_app/features/home/presentation/widgets/appbar_bottombar/navigation_screen_appbar.dart';
import 'package:duaya_app/features/home/presentation/widgets/custom_lottie_floating_avtion_bottom.dart';
import 'package:duaya_app/features/settings/presentation/controller/translation_cubit.dart';
import 'package:duaya_app/utils/connection/check_for_updates.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/exit_app_function_dialoag.dart';
import '../../../common/managers/navigation_menu/navigation_menu_cubit.dart';
import '../../../common/widgets/navigationbar/bottom_navigation_bar.dart';
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
    _fetchData();
    checkForUpdate(context: context);
    updateCode.makeUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationMenuCubit, int>(
      builder: (context, selectedIndex) {
        return WillPopScope(
          onWillPop: () async {
            return await showExitConfirmationDialog(context: context) ?? false;
          },
          child: Scaffold(

              /// AppBar in All Screens
              appBar: const NavigationScreenAppbar(),
              bottomNavigationBar: const CustomBottomNavigationBar(),
              body: RefreshIndicator(
                  displacement: 500,
                  color: ColorRes.greenBlue,
                  backgroundColor: Colors.white,
                  strokeWidth: 4,
                  onRefresh: _onRefreesh,
                  child: _buildScreen(selectedIndex)),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: const CustomLottieFloatingAvtionBottom()),
        );
      },
    );
  }

  /// toggle between screens
  Widget _buildScreen(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const HomeScreen();
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

  /// fetch data for all app
  Future<void> _fetchData() async {
    try {
      await context
          .read<CategoriesByPageCubit>()
          .fetchCategoriesByPage(userID: 0);
    } catch (e) {}
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

  /// fetch refrech data
  Future<void> _onRefreesh() async {
    try {
      await _fetchData();
      await context.read<BestSellerCubit>().fetchBestSellerData();
      await checkForUpdate(context: context);
      await updateCode.makeUpdate();
    } catch (e) {
      print(e);
    }
  }
}
