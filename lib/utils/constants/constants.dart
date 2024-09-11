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

  static List<String> imageMedicalService = [
    AssetRes.mobileApps,
    AssetRes.webApps,
  ];

  static List<String> categoryImage = [
    AssetRes.medicine,
    AssetRes.medicalSupplies,
    AssetRes.beautyTools,
  ];

  static List<IconData> iconOfMenu = [
    Iconsax.wallet,
    Icons.ads_click,
    Icons.ads_click,
    Iconsax.note,
    Icons.medical_services,
    Iconsax.clock,
    Iconsax.message,
  ];

  static List<IconData> iconsSetting = [
    Icons.person,
    Icons.language,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.reset_tv_rounded,
    Icons.logout,
  ];

  // static List<String> textOfMenu = [
  //   S.current.myWallet,
  //   S.current.myStagnantCategories,
  //   S.current.stagnantCategories,
  //   S.current.ShortComing,
  //   S.current.medicalService,
  //   S.current.expiredProduct,
  //   S.current.chatUs,
  // ];

  static List<String> titleSetting = [
    S.current.profileInfo,
    S.current.language,
    S.current.favorite,
    S.current.myOrder,
    S.current.refunds,
    S.current.logOut,
    'Pharmacy Info',
  ];
  static List<String> desSetting = [
    S.current.profileInfoDes,
    S.current.languageDes,
    S.current.favorite,
    S.current!.myOrder!,
    S.current.refunds,
    // 'About of us Company',
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
