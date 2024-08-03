import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:duaya_app/utils/local_storage/cache_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/helpers/firebase_API.dart';
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
    fetchHomeData();
    fetchNavigationsData();
    FirebaseApi().init();
  }

  /// i get here best seller data and silder and category for home screen
  Future<void> fetchHomeData() async {
    String cachedToken = PrefService.getString(key: CacheKeys.token).toString();
    try {
      // if (cachedToken != '' || cachedToken.isNotEmpty || cachedToken != null) {
      await context.read<BestSellerCubit>().fetchSlidersData();
      // }
    } catch (e) {
      print(e);
    }
    try {
      if (cachedToken != '' || cachedToken.isNotEmpty || cachedToken != null) {
        await context.read<BestSellerCubit>().fetchBestSellerData();
      }
    } catch (e) {
      print(e);
    }

    try {
      // if (cachedToken != '' || cachedToken.isNotEmpty || cachedToken != null) {
      await context
          .read<CategoriesByPageCubit>()
          .fetchCategoriesByPage(userID: 0);
      // }
    } catch (e) {
      print(e);
    }
    navigationToHome(context);
  }

  Future<void> fetchNavigationsData() async {
    String cachedToken = PrefService.getString(key: CacheKeys.token).toString();
    try {
      await context.read<FlashCubit>().fetchFlashTodayData();
    } catch (e) {}
    try {
      // await context.read<FlashCubit>().fetchFlashData();
    } catch (e) {
      print(e);
    }
    try {
      if (cachedToken != '' || cachedToken.isNotEmpty || cachedToken != null) {
        await context
            .read<CompaniesByPageCubit>()
            .fetchCompaniesByPageRepositories();
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authController = context.read<AuthControllerCubit>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 280.h,
            ),
            Image.asset(
              AssetRes.appLogo,
            )
          ],
        ),
      ),
    );
  }

  void navigationToHome(BuildContext context) async {
    final authController = context.read<AuthControllerCubit>();
    Future.delayed(
      const Duration(milliseconds: 1500),
      () async {
        if (PrefService.getString(key: CacheKeys.token) == '') {
          authController.fetchCountries();
          context.pushReplacementNamed(DRoutesName.onBoardingRouteTwo);
        } else {
          await authController.fetchLoginData(
              password: PrefService.getString(key: CacheKeys.password)!,
              email: PrefService.getString(key: CacheKeys.email)!,
              context: context);
        }
      },
    );
  }
}
