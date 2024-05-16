// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Duaya`
  String get appName {
    return Intl.message(
      'Duaya',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `skip`
  String get skip {
    return Intl.message(
      'skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `home`
  String get home {
    return Intl.message(
      'home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Best Offers`
  String get bestOffers {
    return Intl.message(
      'Best Offers',
      name: 'bestOffers',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get eMail {
    return Intl.message(
      'E-mail',
      name: 'eMail',
      desc: '',
      args: [],
    );
  }

  /// `The Sale Time ends in`
  String get saleTime {
    return Intl.message(
      'The Sale Time ends in',
      name: 'saleTime',
      desc: '',
      args: [],
    );
  }

  /// `My Order`
  String get myOrder {
    return Intl.message(
      'My Order',
      name: 'myOrder',
      desc: '',
      args: [],
    );
  }

  /// `Choose the type of your business`
  String get worktype {
    return Intl.message(
      'Choose the type of your business',
      name: 'worktype',
      desc: '',
      args: [],
    );
  }

  /// `set your organization name`
  String get workName {
    return Intl.message(
      'set your organization name',
      name: 'workName',
      desc: '',
      args: [],
    );
  }

  /// `choose your city`
  String get selectCity {
    return Intl.message(
      'choose your city',
      name: 'selectCity',
      desc: '',
      args: [],
    );
  }

  /// `please dont let this filed null`
  String get pleaseEndterValue {
    return Intl.message(
      'please dont let this filed null',
      name: 'pleaseEndterValue',
      desc: '',
      args: [],
    );
  }

  /// `Hours`
  String get hours {
    return Intl.message(
      'Hours',
      name: 'hours',
      desc: '',
      args: [],
    );
  }

  /// `There is no internet connection`
  String get NoInternetConnection {
    return Intl.message(
      'There is no internet connection',
      name: 'NoInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `New Product`
  String get newProduct {
    return Intl.message(
      'New Product',
      name: 'newProduct',
      desc: '',
      args: [],
    );
  }

  /// `Select region`
  String get selectRegion {
    return Intl.message(
      'Select region',
      name: 'selectRegion',
      desc: '',
      args: [],
    );
  }

  /// `Verification Code`
  String get verificationCode {
    return Intl.message(
      'Verification Code',
      name: 'verificationCode',
      desc: '',
      args: [],
    );
  }

  /// `The Reset Code is Sent`
  String get emailPasswordSend {
    return Intl.message(
      'The Reset Code is Sent',
      name: 'emailPasswordSend',
      desc: '',
      args: [],
    );
  }

  /// `enter your email or phonenumber and we will send you a password resent link.`
  String get forgetPasswordBody {
    return Intl.message(
      'enter your email or phonenumber and we will send you a password resent link.',
      name: 'forgetPasswordBody',
      desc: '',
      args: [],
    );
  }

  /// `Minutes`
  String get minutes {
    return Intl.message(
      'Minutes',
      name: 'minutes',
      desc: '',
      args: [],
    );
  }

  /// `Seconds`
  String get seconds {
    return Intl.message(
      'Seconds',
      name: 'seconds',
      desc: '',
      args: [],
    );
  }

  /// `Also Available In :`
  String get alsoAvailable {
    return Intl.message(
      'Also Available In :',
      name: 'alsoAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Re Change`
  String get reCharge {
    return Intl.message(
      'Re Change',
      name: 'reCharge',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Select Country`
  String get selectCountry {
    return Intl.message(
      'Select Country',
      name: 'selectCountry',
      desc: '',
      args: [],
    );
  }

  /// `You cannot buy for less than 500 pounds`
  String get buyingLimit {
    return Intl.message(
      'You cannot buy for less than 500 pounds',
      name: 'buyingLimit',
      desc: '',
      args: [],
    );
  }

  /// `saudiArabia`
  String get saudiArabia {
    return Intl.message(
      'saudiArabia',
      name: 'saudiArabia',
      desc: '',
      args: [],
    );
  }

  /// `Sing In`
  String get singIn {
    return Intl.message(
      'Sing In',
      name: 'singIn',
      desc: '',
      args: [],
    );
  }

  /// `Welcome ,`
  String get loginTitle {
    return Intl.message(
      'Welcome ,',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Discover special drugs and medical tools & services`
  String get loginBody {
    return Intl.message(
      'Discover special drugs and medical tools & services',
      name: 'loginBody',
      desc: '',
      args: [],
    );
  }

  /// `Buy Now`
  String get buyNow {
    return Intl.message(
      'Buy Now',
      name: 'buyNow',
      desc: '',
      args: [],
    );
  }

  /// `Chat US`
  String get chatUs {
    return Intl.message(
      'Chat US',
      name: 'chatUs',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password ?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password ?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Remember Me`
  String get rememberMe {
    return Intl.message(
      'Remember Me',
      name: 'rememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message(
      'Reviews',
      name: 'reviews',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Check Out`
  String get checkOut {
    return Intl.message(
      'Check Out',
      name: 'checkOut',
      desc: '',
      args: [],
    );
  }

  /// `Expired Product`
  String get expiredProduct {
    return Intl.message(
      'Expired Product',
      name: 'expiredProduct',
      desc: '',
      args: [],
    );
  }

  /// `Points`
  String get points {
    return Intl.message(
      'Points',
      name: 'points',
      desc: '',
      args: [],
    );
  }

  /// `Add To Cart`
  String get addToCart {
    return Intl.message(
      'Add To Cart',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `Palestine`
  String get Palestine {
    return Intl.message(
      'Palestine',
      name: 'Palestine',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Your credit limit`
  String get yourCreditLimit {
    return Intl.message(
      'Your credit limit',
      name: 'yourCreditLimit',
      desc: '',
      args: [],
    );
  }

  /// `Clinic Name`
  String get clinicName {
    return Intl.message(
      'Clinic Name',
      name: 'clinicName',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get saveChanges {
    return Intl.message(
      'Save Changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Hospital Name`
  String get hospitalName {
    return Intl.message(
      'Hospital Name',
      name: 'hospitalName',
      desc: '',
      args: [],
    );
  }

  /// `Lab Name`
  String get labName {
    return Intl.message(
      'Lab Name',
      name: 'labName',
      desc: '',
      args: [],
    );
  }

  /// `Upload image of the commercial register`
  String get uploadImageCommercial {
    return Intl.message(
      'Upload image of the commercial register',
      name: 'uploadImageCommercial',
      desc: '',
      args: [],
    );
  }

  /// `Payment when Receiving`
  String get paymentwhenReceiving {
    return Intl.message(
      'Payment when Receiving',
      name: 'paymentwhenReceiving',
      desc: '',
      args: [],
    );
  }

  /// `Egypt`
  String get Egypt {
    return Intl.message(
      'Egypt',
      name: 'Egypt',
      desc: '',
      args: [],
    );
  }

  /// `Pharmacy Name`
  String get pharmacyName {
    return Intl.message(
      'Pharmacy Name',
      name: 'pharmacyName',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get userName {
    return Intl.message(
      'User Name',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Bahrain`
  String get Bahrain {
    return Intl.message(
      'Bahrain',
      name: 'Bahrain',
      desc: '',
      args: [],
    );
  }

  /// `Profile Info`
  String get profileInfo {
    return Intl.message(
      'Profile Info',
      name: 'profileInfo',
      desc: '',
      args: [],
    );
  }

  /// `Requested`
  String get requested {
    return Intl.message(
      'Requested',
      name: 'requested',
      desc: '',
      args: [],
    );
  }

  /// `Payment Status`
  String get paymentStatus {
    return Intl.message(
      'Payment Status',
      name: 'paymentStatus',
      desc: '',
      args: [],
    );
  }

  /// `Transaction History`
  String get transactionHistory {
    return Intl.message(
      'Transaction History',
      name: 'transactionHistory',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Your Balance`
  String get yourBalance {
    return Intl.message(
      'Your Balance',
      name: 'yourBalance',
      desc: '',
      args: [],
    );
  }

  /// `Return Request`
  String get returnRequest {
    return Intl.message(
      'Return Request',
      name: 'returnRequest',
      desc: '',
      args: [],
    );
  }

  /// `Clanced`
  String get calnced {
    return Intl.message(
      'Clanced',
      name: 'calnced',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Company`
  String get company {
    return Intl.message(
      'Company',
      name: 'company',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get unknown {
    return Intl.message(
      'Unknown',
      name: 'unknown',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get coontinue {
    return Intl.message(
      'Continue',
      name: 'coontinue',
      desc: '',
      args: [],
    );
  }

  /// `Lets start collect more money with us`
  String get letsStart {
    return Intl.message(
      'Lets start collect more money with us',
      name: 'letsStart',
      desc: '',
      args: [],
    );
  }

  /// ` Whats App Number`
  String get whatsUp {
    return Intl.message(
      ' Whats App Number',
      name: 'whatsUp',
      desc: '',
      args: [],
    );
  }

  /// `My Note Book`
  String get myNoteBook {
    return Intl.message(
      'My Note Book',
      name: 'myNoteBook',
      desc: '',
      args: [],
    );
  }

  /// `Resend Email`
  String get resendEmail {
    return Intl.message(
      'Resend Email',
      name: 'resendEmail',
      desc: '',
      args: [],
    );
  }

  /// `Terms of use`
  String get termsOfUse {
    return Intl.message(
      'Terms of use',
      name: 'termsOfUse',
      desc: '',
      args: [],
    );
  }

  /// `I agree to `
  String get iAgreeTo {
    return Intl.message(
      'I agree to ',
      name: 'iAgreeTo',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Take a Picture Form your Camera for missig items notebook `
  String get takeCameraPhoto {
    return Intl.message(
      'Take a Picture Form your Camera for missig items notebook ',
      name: 'takeCameraPhoto',
      desc: '',
      args: [],
    );
  }

  /// `see all`
  String get seeAll {
    return Intl.message(
      'see all',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Upload File(Exel) or Image for missing products`
  String get uploadFileOrExcelSheet {
    return Intl.message(
      'Upload File(Exel) or Image for missing products',
      name: 'uploadFileOrExcelSheet',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade Package .. increase it`
  String get upgradePackage {
    return Intl.message(
      'Upgrade Package .. increase it',
      name: 'upgradePackage',
      desc: '',
      args: [],
    );
  }

  /// `add Product Or Ads`
  String get addProductOrAds {
    return Intl.message(
      'add Product Or Ads',
      name: 'addProductOrAds',
      desc: '',
      args: [],
    );
  }

  /// `Product Name`
  String get productName {
    return Intl.message(
      'Product Name',
      name: 'productName',
      desc: '',
      args: [],
    );
  }

  /// `Product Image`
  String get productImage {
    return Intl.message(
      'Product Image',
      name: 'productImage',
      desc: '',
      args: [],
    );
  }

  /// `Product Price`
  String get productPrice {
    return Intl.message(
      'Product Price',
      name: 'productPrice',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Beauty Tools`
  String get beautyTools {
    return Intl.message(
      'Beauty Tools',
      name: 'beautyTools',
      desc: '',
      args: [],
    );
  }

  /// `Remaining Uploads`
  String get remainingUploads {
    return Intl.message(
      'Remaining Uploads',
      name: 'remainingUploads',
      desc: '',
      args: [],
    );
  }

  /// `Sale`
  String get flashSale {
    return Intl.message(
      'Sale',
      name: 'flashSale',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Stagnant categories`
  String get stagnantCategories {
    return Intl.message(
      'Stagnant categories',
      name: 'stagnantCategories',
      desc: '',
      args: [],
    );
  }

  /// `My Wallet`
  String get myWallet {
    return Intl.message(
      'My Wallet',
      name: 'myWallet',
      desc: '',
      args: [],
    );
  }

  /// `Medical Service`
  String get medicalService {
    return Intl.message(
      'Medical Service',
      name: 'medicalService',
      desc: '',
      args: [],
    );
  }

  /// `Application and website for the pharmacy `
  String get webAndApp {
    return Intl.message(
      'Application and website for the pharmacy ',
      name: 'webAndApp',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `my Favorites`
  String get favorite {
    return Intl.message(
      'my Favorites',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Choose Image`
  String get chooseImage {
    return Intl.message(
      'Choose Image',
      name: 'chooseImage',
      desc: '',
      args: [],
    );
  }

  /// `Please upload a picture of your pharmacy license or commercial registration to activate your account`
  String get msgImage {
    return Intl.message(
      'Please upload a picture of your pharmacy license or commercial registration to activate your account',
      name: 'msgImage',
      desc: '',
      args: [],
    );
  }

  /// `Unit Price`
  String get unitPrice {
    return Intl.message(
      'Unit Price',
      name: 'unitPrice',
      desc: '',
      args: [],
    );
  }

  /// `Add Product`
  String get addProduct {
    return Intl.message(
      'Add Product',
      name: 'addProduct',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `earned Points`
  String get numberOfPints {
    return Intl.message(
      'earned Points',
      name: 'numberOfPints',
      desc: '',
      args: [],
    );
  }

  /// `E`
  String get ePound {
    return Intl.message(
      'E',
      name: 'ePound',
      desc: '',
      args: [],
    );
  }

  /// `Price before Offer`
  String get priceBeforeOffer {
    return Intl.message(
      'Price before Offer',
      name: 'priceBeforeOffer',
      desc: '',
      args: [],
    );
  }

  /// `Price After Offer`
  String get priceAfterOffer {
    return Intl.message(
      'Price After Offer',
      name: 'priceAfterOffer',
      desc: '',
      args: [],
    );
  }

  /// `avaliable Itmes`
  String get avaliableItemCount {
    return Intl.message(
      'avaliable Itmes',
      name: 'avaliableItemCount',
      desc: '',
      args: [],
    );
  }

  /// `My Stagnant Categories`
  String get myStagnantCategories {
    return Intl.message(
      'My Stagnant Categories',
      name: 'myStagnantCategories',
      desc: '',
      args: [],
    );
  }

  /// `Pharmacy`
  String get pharmacy {
    return Intl.message(
      'Pharmacy',
      name: 'pharmacy',
      desc: '',
      args: [],
    );
  }

  /// `Product Description`
  String get productDescription {
    return Intl.message(
      'Product Description',
      name: 'productDescription',
      desc: '',
      args: [],
    );
  }

  /// `Clinic`
  String get clinic {
    return Intl.message(
      'Clinic',
      name: 'clinic',
      desc: '',
      args: [],
    );
  }

  /// `Hospital `
  String get hospital {
    return Intl.message(
      'Hospital ',
      name: 'hospital',
      desc: '',
      args: [],
    );
  }

  /// `Lab`
  String get lab {
    return Intl.message(
      'Lab',
      name: 'lab',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get menu {
    return Intl.message(
      'Menu',
      name: 'menu',
      desc: '',
      args: [],
    );
  }

  /// `Search here`
  String get search {
    return Intl.message(
      'Search here',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Call us`
  String get callUs {
    return Intl.message(
      'Call us',
      name: 'callUs',
      desc: '',
      args: [],
    );
  }

  /// `Medicine`
  String get medicine {
    return Intl.message(
      'Medicine',
      name: 'medicine',
      desc: '',
      args: [],
    );
  }

  /// `Medical Supplies`
  String get medicalSupplies {
    return Intl.message(
      'Medical Supplies',
      name: 'medicalSupplies',
      desc: '',
      args: [],
    );
  }

  /// `All your purchases in one place`
  String get onboardingTitle1 {
    return Intl.message(
      'All your purchases in one place',
      name: 'onboardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `All companies available for ordering 24/7`
  String get onboardingTitle2 {
    return Intl.message(
      'All companies available for ordering 24/7',
      name: 'onboardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Ordering from Duaya doubles your profits`
  String get onboardingTitle3 {
    return Intl.message(
      'Ordering from Duaya doubles your profits',
      name: 'onboardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Medicines - Medical Supplies - Cosmetics - Medical Devices`
  String get onboardingBody1 {
    return Intl.message(
      'Medicines - Medical Supplies - Cosmetics - Medical Devices',
      name: 'onboardingBody1',
      desc: '',
      args: [],
    );
  }

  /// `With Duaya, you can order anytime, from anywhere`
  String get onboardingBody2 {
    return Intl.message(
      'With Duaya, you can order anytime, from anywhere',
      name: 'onboardingBody2',
      desc: '',
      args: [],
    );
  }

  /// `By providing all needs at the highest discounts from the strongest suppliers`
  String get onboardingBody3 {
    return Intl.message(
      'By providing all needs at the highest discounts from the strongest suppliers',
      name: 'onboardingBody3',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
