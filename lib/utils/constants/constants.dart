import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/exports.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class DConstants {
  static List<String> brandImage = [
    AssetRes.sanofiBrand,
    AssetRes.merckBrand,
    AssetRes.gskBrand,
    AssetRes.sanofiBrand,
    AssetRes.merckBrand,
    AssetRes.gskBrand,
  ];

  static List<String> brandTitle = [
    "company1",
    "company2",
    "company3",
    "company4",
    "company5",
    "company6",
  ];

  static List<String> restaurantImages = [
    'https://www.foodmanufacture.co.uk/var/wrbm_gb_food_pharma/storage/images/_aliases/wrbm_large/1/5/5/1/1091551-1-eng-GB/KFC-prepares-for-growth-with-40M-investment.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Burger_King_logo_%281999%29.svg/2024px-Burger_King_logo_%281999%29.svg.png',
    'https://www.foodmanufacture.co.uk/var/wrbm_gb_food_pharma/storage/images/_aliases/wrbm_large/1/5/5/1/1091551-1-eng-GB/KFC-prepares-for-growth-with-40M-investment.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Burger_King_logo_%281999%29.svg/2024px-Burger_King_logo_%281999%29.svg.png',
    'https://www.foodmanufacture.co.uk/var/wrbm_gb_food_pharma/storage/images/_aliases/wrbm_large/1/5/5/1/1091551-1-eng-GB/KFC-prepares-for-growth-with-40M-investment.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Burger_King_logo_%281999%29.svg/2024px-Burger_King_logo_%281999%29.svg.png',
    'https://www.foodmanufacture.co.uk/var/wrbm_gb_food_pharma/storage/images/_aliases/wrbm_large/1/5/5/1/1091551-1-eng-GB/KFC-prepares-for-growth-with-40M-investment.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Burger_King_logo_%281999%29.svg/2024px-Burger_King_logo_%281999%29.svg.png',
    'https://www.foodmanufacture.co.uk/var/wrbm_gb_food_pharma/storage/images/_aliases/wrbm_large/1/5/5/1/1091551-1-eng-GB/KFC-prepares-for-growth-with-40M-investment.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Burger_King_logo_%281999%29.svg/2024px-Burger_King_logo_%281999%29.svg.png',
    'https://www.foodmanufacture.co.uk/var/wrbm_gb_food_pharma/storage/images/_aliases/wrbm_large/1/5/5/1/1091551-1-eng-GB/KFC-prepares-for-growth-with-40M-investment.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Burger_King_logo_%281999%29.svg/2024px-Burger_King_logo_%281999%29.svg.png',
  ];

  static List<String> bannersList = [
    AssetRes.banner,
    AssetRes.banner2,
    AssetRes.banner3,
  ];

  static List<String> texts = [
    'Be a partner',
    'Technical support',
    'Help center',
    'Submit proposals',
    'Terms of Use',
    'Terms and conditions',
    'Share the app',
    'Application language',
  ];

  static List<String> images = [
    'assets/images/logoIcon.png',
    'assets/images/chatIcon.png',
    'assets/images/informationIcon.png',
    'assets/images/auditIcon.png',
    'assets/images/fileIcon.png',
    'assets/images/fileIcon.png',
    'assets/images/sharingIcon.png',
    'assets/images/translateIcon.png',
  ];

  static List<String> imageMedicalService = [
    AssetRes.mobileApps,
    AssetRes.webApps,
  ];

  static List<String> categoryImage = [
    AssetRes.medicine,
    AssetRes.medicalSupplies,
    AssetRes.beautyTools,
  ];

  static List<String> textOfMenu = [
    S.current.myWallet,
    S.current.myStagnantCategories,
    S.current.stagnantCategories,
    S.current.myOrder,
    S.current.ShortComing,
    S.current.medicalService,
    S.current.expiredProduct,
    S.current.favorite,
    S.current.chatUs,
    S.current.returnRequest
  ];

  static List<IconData> iconOfMenu = [
    Iconsax.wallet,
    Icons.ads_click,
    Icons.ads_click,
    Iconsax.shopping_cart,
    Iconsax.note,
    Icons.medical_services,
    Iconsax.clock,
    Icons.favorite_border,
    Iconsax.message,
    Icons.reset_tv_outlined,
  ];

  static List<String> titleSetting = [
    S.current.profileInfo,
    S.current.language,
    // S.current.selectCountry,
    S.current.aboutApp,
    S.current.logOut,
    'Pharmacy Info',
  ];

  static List<IconData> iconsSetting = [
    Icons.local_pharmacy,
    Icons.language,
    // Icons.flag,
    Icons.favorite,
    Icons.logout,
    Icons.person,
  ];

  static List<String> desSetting = [
    S.current.profileInfoDes,
    S.current.languageDes,
    // S.current.selectCountry,
    'About of us Company',
    S.current.logOut,
    'Make Changes to your account',
  ];

  static launchFacebookProfile({required String faceLink}) async {
    String facebookUrl = faceLink;

    if (await canLaunch(facebookUrl)) {
      await launch(facebookUrl);
    } else {
      throw 'Could not launch $facebookUrl';
    }
  }

  static openWhatsAppChat(
      {required String num, required String urlLink}) async {
    String phoneNumber = num;
    String url = urlLink;

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> openInstagram() async {
    const url = 'https://www.instagram.com'; // Instagram URL
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  /// Make Stars
  static buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }
}
