import 'package:duaya_app/common/screens/no_connection/no_connection.dart';
import 'package:duaya_app/features/authentication/presentation/login/login.dart';
import 'package:duaya_app/features/authentication/presentation/password_configuration/forget_password.dart';
import 'package:duaya_app/features/authentication/presentation/password_configuration/reset_password.dart';
import 'package:duaya_app/features/authentication/presentation/password_configuration/send_otp.dart';
import 'package:duaya_app/features/authentication/presentation/signup/signup.dart';
import 'package:duaya_app/features/cart/presentation/cart_screen.dart';
// import 'package:duaya_app/features/cart/presentation/add_new_address_form_screem.dart';
// import 'package:duaya_app/features/cart/presentation/add_new_address_screen.dart';
// import 'package:duaya_app/features/cart/presentation/payment_screen.dart';
// import 'package:duaya_app/features/cart/presentation/shipping_information_screen.dart';
import 'package:duaya_app/features/category/presentation/category/presentation/company_details_screen.dart';
import 'package:duaya_app/features/gift/presentation/gift_screen.dart';
import 'package:duaya_app/features/home/presentation/details_product.dart';
import 'package:duaya_app/features/menu/presentation/customer_ads/customer_ads_screen.dart';
import 'package:duaya_app/features/menu/presentation/expire_product/add_new_product_screen.dart';
import 'package:duaya_app/features/menu/presentation/expire_product/expire_products_screen.dart';
import 'package:duaya_app/features/menu/presentation/favorite/favorite_screen.dart';
import 'package:duaya_app/features/menu/presentation/medical_service/medical_service_screen.dart';
import 'package:duaya_app/features/menu/presentation/my_ads/add_product_or_ads_screen.dart';
import 'package:duaya_app/features/menu/presentation/my_ads/my_ads_screen.dart';
import 'package:duaya_app/features/menu/presentation/my_note_book/my_note_book_screen.dart';
import 'package:duaya_app/features/menu/presentation/my_order/my_order_screen.dart';
import 'package:duaya_app/features/menu/presentation/return_request/return_request_screen.dart';
import 'package:duaya_app/features/menu/presentation/wallet/wallet_screen.dart';
import 'package:duaya_app/features/onboarding/presentation/onboarding.dart';
import 'package:duaya_app/features/settings/presentation/pharmacy_info/pharmacy_info_screen.dart';
import 'package:duaya_app/features/settings/presentation/profile_info/profile_info_screen.dart';
import 'package:duaya_app/features/settings/presentation/settings_screen.dart';
import 'package:duaya_app/features/splash/splash_screen.dart';
import 'package:duaya_app/navigation_menu.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../common/gifImages.dart';
import '../common/webViewPage.dart';
import '../features/category/presentation/category/presentation/certain_category_screen.dart';
import '../utils/constants/exports.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      /// *************************************** Start No Connection *************************************** \\\
      // case DRoutesName.noConnectionRoute:
      //   return PageTransition(
      //     child: const NoConnectionScreen(),
      //     type: PageTransitionType.rightToLeftWithFade,
      //     settings: settings,
      //     reverseDuration: const Duration(milliseconds: 700),
      //   );

      /// *************************************** End No Connection *************************************** \\\

      /// *************************************** Start Authentication *************************************** \\\
      case DRoutesName.splashRoute:
        return PageTransition(
          child: const SplashScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );
      case DRoutesName.test:
        return PageTransition(
          child: GifImages(
            url: '',
          ),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );
      case DRoutesName.onBoardingRoute:
        return PageTransition(
          child: const OnBoardingScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );
      case DRoutesName.loginRoute:
        return PageTransition(
          child: const LoginScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );
      case DRoutesName.forgetPasswordRoute:
        return PageTransition(
          child: const ForgetPassword(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );
      case DRoutesName.verifyCodeRoute:
        String phone = settings.arguments as String;
        return PageTransition(
          child: SendOTPScreen(phone: phone),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );
      case DRoutesName.resetPasswordRoute:
        return PageTransition(
          child: const ResetPasswordScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );
      case DRoutesName.signupRoute:
        return PageTransition(
          child: const SignupScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );

      case DRoutesName.webViewRoute:
        String url = settings.arguments as String;
        return PageTransition(
          child: WebViewPage(url: url),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );

      case DRoutesName.detailsProductRoute:
        final Map<String, dynamic> map =
            settings.arguments as Map<String, dynamic>;
        return PageTransition(
          child: DetailsProduct(
            map: map,
          ),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );

      case DRoutesName.walletRoute:
        return PageTransition(
          child: const WalletScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );
      case DRoutesName.certainCategoryRoute:
        final Map<String, dynamic> map =
            settings.arguments as Map<String, dynamic>;
        return PageTransition(
          child: certainCategoryScreen(map: map),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );

      case DRoutesName.myAdsRoute:
        return PageTransition(
          child: const MyAdsScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );

      case DRoutesName.customerAdsRoute:
        return PageTransition(
          child: const CustomerAdsScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );

      case DRoutesName.myOrderRoute:
        return PageTransition(
          child: const MyOrderScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );

      case DRoutesName.myNoteBookRoute:
        return PageTransition(
          child: const MyNoteBookScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );

      case DRoutesName.expireProductRoute:
        return PageTransition(
          child: const ExpireProductsScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );

      case DRoutesName.favoriteRoute:
        return PageTransition(
          child: const FavoriteScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );

      case DRoutesName.returnRequestRoute:
        return PageTransition(
          child: ReturnRequestScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );

      case DRoutesName.medicalServiceRoute:
        return PageTransition(
          child: const MedicalServiceScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );

      /// *************************************** End Authentication *************************************** \\\

      /// *************************************** Start Navigation Bar *************************************** \\\
      case DRoutesName.navigationMenuRoute:
        return PageTransition(
          child: const NavigationMenu(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );
      case DRoutesName.giftRoute:
        return PageTransition(
          child: const GiftScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );
      case DRoutesName.CartRoute:
        return PageTransition(
          child: const CartScreen(),
          type: PageTransitionType.leftToRightWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );
      case DRoutesName.settingsRoute:
        return PageTransition(
          child: const SettingsScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );
      case DRoutesName.profileInfoRoute:
        return PageTransition(
          child: const ProfileInfoScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );
      case DRoutesName.pharmacyInfoRoute:
        return PageTransition(
          child: const PharmacyInfoScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );

      case DRoutesName.addNewProductRoute:
        return PageTransition(
          child: const AddNewProductScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );
      case DRoutesName.shippingInformationRoute:
        return PageTransition(
          // child:  const ShippingInformationScreen(),
          child: const PharmacyInfoScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );

      case DRoutesName.addNewAddressRoute:
        return PageTransition(
          // child:  const AddNewAddressScreen(),
          child: const PharmacyInfoScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );

      case DRoutesName.addNewAddressFormRoute:
        return PageTransition(
          // child:  const AddNewAddressFormScreen(),
          child: const PharmacyInfoScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );

      case DRoutesName.paymentRoute:
        return PageTransition(
          // child:  const PaymentScreen(),
          child: const PharmacyInfoScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );

      case DRoutesName.companyDetailsRoute:
        final Map<String, dynamic> map =
            settings.arguments as Map<String, dynamic>;

        return PageTransition(
          child: CompanyDetailsScreen(map: map),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );

      case DRoutesName.addNewProductOrAdsRoute:
        return PageTransition(
          child: const AddProductOrAdsScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );

      default:
        return unDefinedRoute();
    }
  }

  /// Un Defined Route
  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            '',
          ),
        ),
        body: const Center(
          child: Text(
            '',
          ),
        ),
      ),
    );
  }
}
