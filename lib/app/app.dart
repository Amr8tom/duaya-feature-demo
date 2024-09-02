import 'package:dio/dio.dart';
import 'package:duaya_app/common/managers/navigation_menu/navigation_menu_cubit.dart';
import 'package:duaya_app/features/address/presentation/controller/address_cubit.dart';
import 'package:duaya_app/features/cart/presentation/widgets/controller/cart_cubit.dart';
import 'package:duaya_app/features/gift/presentation/controller/gift_cubit.dart';
import 'package:duaya_app/features/home/presentation/controller/best_seller_cubit.dart';
import 'package:duaya_app/features/onboarding/managers/onboarding_cubit/onboarding_cubit.dart';
import 'package:duaya_app/main.dart';
import 'package:duaya_app/routing/routes.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../features/authentication/presentation/controller/auth_controller_cubit.dart';
import '../features/category/presentation/category/presentation/controller/categories_by_page_cubit.dart';
import '../features/category/presentation/category/presentation/controller/companies_by_page_cubit.dart';
import '../features/payment/data/services.dart';
import '../features/payment/presentation/controller/payment_cubit.dart';
import '../features/search/presentation/controller/search_cubit.dart';
import '../features/flash/presentation/controller/flash_cubit.dart';
import '../features/services/medical_service/presentation/controller/medical_services_cubit.dart';
import '../features/settings/presentation/controller/translation_cubit.dart';
import '../features/settings/presentation/controller/update_profile_cubit.dart';
import '../generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class DuayaApp extends StatelessWidget {
  DuayaApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Dio dio = Dio();
    final FawaterkServices fawaterkServices = FawaterkServices(dio: dio);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => FlashCubit()),
              BlocProvider(create: (context) => CompaniesByPageCubit()),
              BlocProvider(create: (context) => SearchCubit()),
              BlocProvider(create: (context) => PaymentCubit(fawaterkServices)),
              BlocProvider(create: (context) => GiftCubit()),
              BlocProvider(create: (context) => CategoriesByPageCubit()),
              BlocProvider(create: (context) => AuthControllerCubit()),
              BlocProvider(create: (context) => CartCubit()),
              BlocProvider(create: (context) => AddressCubit()),
              BlocProvider(create: (context) => BestSellerCubit()),
              BlocProvider(create: (context) => OnBoardingCubit()),
              BlocProvider(create: (context) => MedicalServicesCubit()),
              BlocProvider(create: (context) => UpdateProfileCubit()),
              BlocProvider<NavigationMenuCubit>(
                  create: (context) => NavigationMenuCubit()),
            ],
            child: BlocConsumer<SettinglationCubit, TranslationState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  themeMode: ThemeMode.system,
                  theme: DAppTheme.lightTheme(context),
                  darkTheme: DAppTheme.lightTheme(context),
                  navigatorKey: navigatorKey,
                  onGenerateRoute: RouteGenerator.getRoute,
                  initialRoute: DRoutesName.splashRoute,
                  localeResolutionCallback: (locale, supportedLocales) {
                    return context.read<SettinglationCubit>().currentLanguage;
                  },
                  supportedLocales: S.delegate.supportedLocales,
                  localizationsDelegates: [
                    S.delegate, // //
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate
                  ],
                );
              },
            ));
      },
    );
  }
}
