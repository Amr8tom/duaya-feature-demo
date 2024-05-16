import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:duaya_app/utils/local_storage/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';

import '../../utils/local_storage/cach_keys.dart';
import '../authentication/presentation/controller/auth_controller_cubit.dart';
import '../category/presentation/category/presentation/controller/categories_by_page_cubit.dart';
import '../category/presentation/category/presentation/controller/companies_by_page_cubit.dart';
import '../flash/presentation/controller/flash_cubit.dart';
import '../home/presentation/controller/best_seller_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLocationPermission();
    openSettingLocation();
    fetchDataOnInit();
  }

  Future<void> fetchDataOnInit() async {
    await context.read<BestSellerCubit>().fetchSlidersData();
    await context
        .read<CategoriesByPageCubit>()
        .fetchCategoriesByPage(userID: 0);

    await context.read<BestSellerCubit>().fetchBestSellerData();
    try {
      await context.read<FlashCubit>().fetchFlashData();
    } catch (e) {
      print(e);
    }

    await context
        .read<CompaniesByPageCubit>()
        .fetchCompaniesByPageRepositories();
  }

  @override
  Widget build(BuildContext context) {
    final authController = context.read<AuthControllerCubit>();
    return Scaffold(
      body: Lottie.asset(AssetRes.splashLottie,
          fit: BoxFit.cover,
          width: 400.sp // Use BoxFit to fill the Expanded widget

          // fit: BoxFit.fill,
          ),
    );
  }

  Future<void> checkLocationPermission() async {
    LocationPermission permission;

    /// Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      /// Request to enable location services
      serviceEnabled = await Geolocator.openLocationSettings();
      if (!serviceEnabled) {
        /// Handle if user doesn't enable location services
        return;
      }
    }

    /// Check if location permission is granted
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      /// Request location permission
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        /// Handle if user doesn't grant location permission
        return;
      }
    }

    /// If location services and permissions are enabled, navigate to the home screen
    navigationToHome(context);
  }

  void openSettingLocation() async {
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      await Geolocator.openLocationSettings();
    }
  }

  void navigationToHome(BuildContext context) async {
    final authController = context.read<AuthControllerCubit>();
    Future.delayed(
      const Duration(milliseconds: 10),
      () async {
        if (PrefService.getString(key: CacheKeys.token) == '') {
          // await context.read<BestSellerCubit>().fetchSlidersData();
          // await context
          //     .read<CategoriesByPageCubit>()
          //     .fetchCategoriesByPage(userID: 0);
          //
          // await context.read<BestSellerCubit>().fetchBestSellerData();
          // await context.read<FlashCubit>().fetchFlashData();
          // await context
          //     .read<CompaniesByPageCubit>()
          //     .fetchCompaniesByPageRepositories();
          await context.read<AuthControllerCubit>().fetchLocationsData();

          context.pushReplacementNamed(DRoutesName.onBoardingRoute);
        } else {
          await context.read<AuthControllerCubit>().fetchLocationsData();

          // await context.read<BestSellerCubit>().fetchSlidersData();
          // await context
          //     .read<CategoriesByPageCubit>()
          //     .fetchCategoriesByPage(userID: 0);
          // await context.read<BestSellerCubit>().fetchBestSellerData();
          // await context.read<FlashCubit>().fetchFlashData();
          // await context
          //     .read<CompaniesByPageCubit>()
          //     .fetchCompaniesByPageRepositories();

          await authController.fetchLoadingData(
              password: PrefService.getString(key: CacheKeys.password)!,
              email: PrefService.getString(key: CacheKeys.email)!,
              context: context);
        }
      },
    );
  }
}
