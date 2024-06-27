import 'package:duaya_app/features/authentication/presentation/login/login.dart';
import 'package:duaya_app/features/authentication/presentation/password_configuration/forget_password.dart';
import 'package:duaya_app/features/authentication/presentation/password_configuration/reset_password.dart';
import 'package:duaya_app/features/authentication/presentation/password_configuration/send_otp.dart';
import 'package:duaya_app/features/authentication/presentation/signup/signup.dart';
import 'package:duaya_app/features/cart/presentation/cart_screen.dart';
import 'package:duaya_app/features/category/presentation/company/company_details_screen.dart';
import 'package:duaya_app/features/gift/presentation/gift_screen.dart';
import 'package:duaya_app/features/home/presentation/details_product.dart';
import 'package:duaya_app/features/menu/presentation/customer_ads/customer_ads_screen.dart';
import 'package:duaya_app/features/menu/presentation/favorite/favorite_screen.dart';
import 'package:duaya_app/features/menu/presentation/medical_service/presentation/medical_service_screen.dart';
import 'package:duaya_app/features/menu/presentation/my_ads/add_product_or_ads_screen.dart';
import 'package:duaya_app/features/menu/presentation/my_ads/my_ads_screen.dart';
import 'package:duaya_app/features/menu/presentation/my_order/my_order_screen.dart';
import 'package:duaya_app/features/menu/presentation/return_request/return_request_screen.dart';
import 'package:duaya_app/features/menu/presentation/wallet/presentation/wallet_screen.dart';
import 'package:duaya_app/features/onboarding/presentation/onboarding.dart';
import 'package:duaya_app/features/payment/presentation/cash_on_delivery_screen/cash_on_delivery_screen.dart';
import 'package:duaya_app/features/payment/presentation/credit_card_payment_screen/credit_card_payment_screen.dart';
import 'package:duaya_app/features/payment/presentation/delayed_cash_screen/delayed_cash_screen.dart';
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
import '../features/address/presentation/address_form_screen.dart';
import '../features/address/presentation/address_list_screen.dart';
import '../features/category/presentation/category/category_screen.dart';
import '../features/category/presentation/category/presentation/certain_category_screen.dart';
import '../features/menu/presentation/expire_product/presentation/add_new_product_screen.dart';
import '../features/menu/presentation/expire_product/presentation/expire_products_screen.dart';
import '../features/menu/presentation/my_shor_coming_book/my_short_coming_book_screen.dart';
import '../features/payment/presentation/main_payment_screen.dart';
import '../features/payment/presentation/wallet_cache_Screen/wallet_cash_screen.dart';
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
          child: OnBoardingScreen(),
          type: PageTransitionType.fade,
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

      case DRoutesName.categoriesRoute:
        return PageTransition(
          child: CategoryScreen(),
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
          child: ShortComingScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );

      case DRoutesName.expireProductRoute:
        return PageTransition(
          child: ExpireProductsScreen(),
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
        final Map<String, dynamic> map = settings.arguments
            as Map<String, dynamic>; // Safely cast to nullable bool
        return PageTransition(
          child: AddNewProductScreen(map: map),
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

      // case DRoutesName.addNewAddressFormRoute:
      //   return PageTransition(
      //     // child:  const AddNewAddressFormScreen(),
      //     child: const PharmacyInfoScreen(),
      //     type: PageTransitionType.rightToLeftWithFade,
      //     settings: settings,
      //     reverseDuration: const Duration(milliseconds: 700),
      //   );

      case DRoutesName.paymentRoute:
        return PageTransition(
          child: PaymentScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );

      case DRoutesName.DelayedCashRoute:
        return PageTransition(
          child: DelayedCashScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );

      case DRoutesName.walletPaymentRoute:
        return PageTransition(
          child: WalletPaymentScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );

      case DRoutesName.CreditCardPaymentRoute:
        return PageTransition(
          child: CreditCardPaymentScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );

      case DRoutesName.CashOnDeliveryRoute:
        return PageTransition(
          child: CashOnDeliveryScreen(),
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

      case DRoutesName.addNewAddressFormRoute:
        final args = settings.arguments as Map<String, dynamic>;
        final String ID = args['ID'];
        final bool isUpdate = args['isUpdate'];
        return PageTransition(
          child: AddressFormScreen(ID: ID, isUpdate: isUpdate),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 700),
        );
      // case DRoutesName.addressRoute:
      //   final Map<String, dynamic> map =
      //       settings.arguments as Map<String, dynamic>;
      //   return PageTransition(
      //     child: AddressScreen(),
      //     type: PageTransitionType.rightToLeftWithFade,
      //     settings: settings,
      //     reverseDuration: const Duration(milliseconds: 700),
      //   );
      case DRoutesName.AddressListRoute:
        return PageTransition(
          child: AddressListScreen(),
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
