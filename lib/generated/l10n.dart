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

  /// `Order Number `
  String get orderNumber {
    return Intl.message(
      'Order Number ',
      name: 'orderNumber',
      desc: '',
      args: [],
    );
  }

  /// `The Cost`
  String get cost {
    return Intl.message(
      'The Cost',
      name: 'cost',
      desc: '',
      args: [],
    );
  }

  /// `history`
  String get history {
    return Intl.message(
      'history',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Cancle The Order`
  String get cancleOrder {
    return Intl.message(
      'Cancle The Order',
      name: 'cancleOrder',
      desc: '',
      args: [],
    );
  }

  /// `Later`
  String get later {
    return Intl.message(
      'Later',
      name: 'later',
      desc: '',
      args: [],
    );
  }

  /// `Arrival Time`
  String get round {
    return Intl.message(
      'Arrival Time',
      name: 'round',
      desc: '',
      args: [],
    );
  }

  /// `installments with bank `
  String get installmentsbank {
    return Intl.message(
      'installments with bank ',
      name: 'installmentsbank',
      desc: '',
      args: [],
    );
  }

  /// `Nearst Tombstone`
  String get Tombstone {
    return Intl.message(
      'Nearst Tombstone',
      name: 'Tombstone',
      desc: '',
      args: [],
    );
  }

  /// `Place Name`
  String get placeName {
    return Intl.message(
      'Place Name',
      name: 'placeName',
      desc: '',
      args: [],
    );
  }

  /// `Morning shift Number`
  String get MorningShift {
    return Intl.message(
      'Morning shift Number',
      name: 'MorningShift',
      desc: '',
      args: [],
    );
  }

  /// `evening shift Number`
  String get eveningShift {
    return Intl.message(
      'evening shift Number',
      name: 'eveningShift',
      desc: '',
      args: [],
    );
  }

  /// `Street Name`
  String get streetName {
    return Intl.message(
      'Street Name',
      name: 'streetName',
      desc: '',
      args: [],
    );
  }

  /// `Building Number`
  String get buildingNumber {
    return Intl.message(
      'Building Number',
      name: 'buildingNumber',
      desc: '',
      args: [],
    );
  }

  /// `Refund Reason`
  String get refundReason {
    return Intl.message(
      'Refund Reason',
      name: 'refundReason',
      desc: '',
      args: [],
    );
  }

  /// `Lowest Limit`
  String get limit {
    return Intl.message(
      'Lowest Limit',
      name: 'limit',
      desc: '',
      args: [],
    );
  }

  /// `are you sure that you want to cancle this order`
  String get cancleOrderBody {
    return Intl.message(
      'are you sure that you want to cancle this order',
      name: 'cancleOrderBody',
      desc: '',
      args: [],
    );
  }

  /// `Follow Order`
  String get followOeder {
    return Intl.message(
      'Follow Order',
      name: 'followOeder',
      desc: '',
      args: [],
    );
  }

  /// `Oreder Placed`
  String get orederPlaced {
    return Intl.message(
      'Oreder Placed',
      name: 'orederPlaced',
      desc: '',
      args: [],
    );
  }

  /// `Place Number`
  String get placeNumber {
    return Intl.message(
      'Place Number',
      name: 'placeNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please Try Later`
  String get tryLater {
    return Intl.message(
      'Please Try Later',
      name: 'tryLater',
      desc: '',
      args: [],
    );
  }

  /// `there is no items in cart`
  String get noItemsInCart {
    return Intl.message(
      'there is no items in cart',
      name: 'noItemsInCart',
      desc: '',
      args: [],
    );
  }

  /// `Accepted`
  String get accepted {
    return Intl.message(
      'Accepted',
      name: 'accepted',
      desc: '',
      args: [],
    );
  }

  /// `Agent Code (Optional)`
  String get agentCode {
    return Intl.message(
      'Agent Code (Optional)',
      name: 'agentCode',
      desc: '',
      args: [],
    );
  }

  /// `there is an error`
  String get error {
    return Intl.message(
      'there is an error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `refunds`
  String get refunds {
    return Intl.message(
      'refunds',
      name: 'refunds',
      desc: '',
      args: [],
    );
  }

  /// `packing`
  String get packing {
    return Intl.message(
      'packing',
      name: 'packing',
      desc: '',
      args: [],
    );
  }

  /// `companies`
  String get companies {
    return Intl.message(
      'companies',
      name: 'companies',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Souhoola`
  String get souhoola {
    return Intl.message(
      'Souhoola',
      name: 'souhoola',
      desc: '',
      args: [],
    );
  }

  /// `Installments Services`
  String get installmentsServices {
    return Intl.message(
      'Installments Services',
      name: 'installmentsServices',
      desc: '',
      args: [],
    );
  }

  /// `Valu`
  String get valu {
    return Intl.message(
      'Valu',
      name: 'valu',
      desc: '',
      args: [],
    );
  }

  /// `if you doesnt receive a massage from us to continue buying use this qr code `
  String get mobilWalletOption {
    return Intl.message(
      'if you doesnt receive a massage from us to continue buying use this qr code ',
      name: 'mobilWalletOption',
      desc: '',
      args: [],
    );
  }

  /// `Installment with souhoola`
  String get installmentWithSouhoola {
    return Intl.message(
      'Installment with souhoola',
      name: 'installmentWithSouhoola',
      desc: '',
      args: [],
    );
  }

  /// `Installment with valu`
  String get installmentWithValu {
    return Intl.message(
      'Installment with valu',
      name: 'installmentWithValu',
      desc: '',
      args: [],
    );
  }

  /// `shipping`
  String get shipping {
    return Intl.message(
      'shipping',
      name: 'shipping',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get Delivered {
    return Intl.message(
      'Delivered',
      name: 'Delivered',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `pay with fawry`
  String get fawry {
    return Intl.message(
      'pay with fawry',
      name: 'fawry',
      desc: '',
      args: [],
    );
  }

  /// `use to code to payment`
  String get fawryDes {
    return Intl.message(
      'use to code to payment',
      name: 'fawryDes',
      desc: '',
      args: [],
    );
  }

  /// ` Mobile Wallet`
  String get mobileWallet {
    return Intl.message(
      ' Mobile Wallet',
      name: 'mobileWallet',
      desc: '',
      args: [],
    );
  }

  /// `you can pay using your mobile phone wallet`
  String get mobileWalletDes {
    return Intl.message(
      'you can pay using your mobile phone wallet',
      name: 'mobileWalletDes',
      desc: '',
      args: [],
    );
  }

  /// `Follow Order`
  String get followOrder {
    return Intl.message(
      'Follow Order',
      name: 'followOrder',
      desc: '',
      args: [],
    );
  }

  /// `Back To Home`
  String get backToHome {
    return Intl.message(
      'Back To Home',
      name: 'backToHome',
      desc: '',
      args: [],
    );
  }

  /// `under delivery`
  String get underDelivery {
    return Intl.message(
      'under delivery',
      name: 'underDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Get Payment Code`
  String get getPaymentCode {
    return Intl.message(
      'Get Payment Code',
      name: 'getPaymentCode',
      desc: '',
      args: [],
    );
  }

  /// `Your Code To Pay`
  String get fawryCode {
    return Intl.message(
      'Your Code To Pay',
      name: 'fawryCode',
      desc: '',
      args: [],
    );
  }

  /// `Other Types`
  String get OtherTypes {
    return Intl.message(
      'Other Types',
      name: 'OtherTypes',
      desc: '',
      args: [],
    );
  }

  /// `Re-Order`
  String get reOrder {
    return Intl.message(
      'Re-Order',
      name: 'reOrder',
      desc: '',
      args: [],
    );
  }

  /// `Order Details`
  String get orderDetails {
    return Intl.message(
      'Order Details',
      name: 'orderDetails',
      desc: '',
      args: [],
    );
  }

  /// `Oreder Placed and we review it `
  String get orederPlacedBody {
    return Intl.message(
      'Oreder Placed and we review it ',
      name: 'orederPlacedBody',
      desc: '',
      args: [],
    );
  }

  /// `Your order is Accepted`
  String get acceptedBody {
    return Intl.message(
      'Your order is Accepted',
      name: 'acceptedBody',
      desc: '',
      args: [],
    );
  }

  /// `we are packing your order and searching for nearest delivery`
  String get packingBody {
    return Intl.message(
      'we are packing your order and searching for nearest delivery',
      name: 'packingBody',
      desc: '',
      args: [],
    );
  }

  /// `please wait your order in the way `
  String get shippingBody {
    return Intl.message(
      'please wait your order in the way ',
      name: 'shippingBody',
      desc: '',
      args: [],
    );
  }

  /// `Your order is Delivered please call us for any problems`
  String get DeliveredBody {
    return Intl.message(
      'Your order is Delivered please call us for any problems',
      name: 'DeliveredBody',
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

  /// `avaliable to loan`
  String get avaiableToLoan {
    return Intl.message(
      'avaliable to loan',
      name: 'avaiableToLoan',
      desc: '',
      args: [],
    );
  }

  /// `you loan`
  String get moneyYouLoan {
    return Intl.message(
      'you loan',
      name: 'moneyYouLoan',
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

  /// `Enter The Mobile Wallet Number`
  String get enterMobileWallet {
    return Intl.message(
      'Enter The Mobile Wallet Number',
      name: 'enterMobileWallet',
      desc: '',
      args: [],
    );
  }

  /// `Please try again or sign up`
  String get tryAgain {
    return Intl.message(
      'Please try again or sign up',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `if you didnt receive massage scan this QRcode`
  String get QRCodeDes {
    return Intl.message(
      'if you didnt receive massage scan this QRcode',
      name: 'QRCodeDes',
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

  /// `Current Requests`
  String get currentRequest {
    return Intl.message(
      'Current Requests',
      name: 'currentRequest',
      desc: '',
      args: [],
    );
  }

  /// `Previous Requests`
  String get previousRequest {
    return Intl.message(
      'Previous Requests',
      name: 'previousRequest',
      desc: '',
      args: [],
    );
  }

  /// `Update Available`
  String get updateAvailable {
    return Intl.message(
      'Update Available',
      name: 'updateAvailable',
      desc: '',
      args: [],
    );
  }

  /// `A new version of the Duaya is available. Please update to continue`
  String get updateBody {
    return Intl.message(
      'A new version of the Duaya is available. Please update to continue',
      name: 'updateBody',
      desc: '',
      args: [],
    );
  }

  /// `point`
  String get point {
    return Intl.message(
      'point',
      name: 'point',
      desc: '',
      args: [],
    );
  }

  /// `Remote Payment`
  String get remotePayment {
    return Intl.message(
      'Remote Payment',
      name: 'remotePayment',
      desc: '',
      args: [],
    );
  }

  /// `send to wallet `
  String get sendToWallet {
    return Intl.message(
      'send to wallet ',
      name: 'sendToWallet',
      desc: '',
      args: [],
    );
  }

  /// `Contact  With Client`
  String get contactWithClient {
    return Intl.message(
      'Contact  With Client',
      name: 'contactWithClient',
      desc: '',
      args: [],
    );
  }

  /// `you can use the wallet balance to buy `
  String get walletTitle {
    return Intl.message(
      'you can use the wallet balance to buy ',
      name: 'walletTitle',
      desc: '',
      args: [],
    );
  }

  /// `continue`
  String get continueShoping {
    return Intl.message(
      'continue',
      name: 'continueShoping',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Address first`
  String get selectAddress {
    return Intl.message(
      'Please Select Address first',
      name: 'selectAddress',
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

  /// `installments on 6 months`
  String get installments6mon {
    return Intl.message(
      'installments on 6 months',
      name: 'installments6mon',
      desc: '',
      args: [],
    );
  }

  /// `installments on 12 months`
  String get installments12mon {
    return Intl.message(
      'installments on 12 months',
      name: 'installments12mon',
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

  /// `verified`
  String get verified {
    return Intl.message(
      'verified',
      name: 'verified',
      desc: '',
      args: [],
    );
  }

  /// `please verify your account`
  String get notVerified {
    return Intl.message(
      'please verify your account',
      name: 'notVerified',
      desc: '',
      args: [],
    );
  }

  /// `No results found`
  String get noResult {
    return Intl.message(
      'No results found',
      name: 'noResult',
      desc: '',
      args: [],
    );
  }

  /// `Exit App`
  String get exitApp {
    return Intl.message(
      'Exit App',
      name: 'exitApp',
      desc: '',
      args: [],
    );
  }

  /// `The amount`
  String get amount {
    return Intl.message(
      'The amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `There is no data here till now`
  String get noData {
    return Intl.message(
      'There is no data here till now',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to exit the app?`
  String get confirmExitMessage {
    return Intl.message(
      'Are you sure you want to exit the app?',
      name: 'confirmExitMessage',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Recharge Wallet`
  String get rechangreWallet {
    return Intl.message(
      'Recharge Wallet',
      name: 'rechangreWallet',
      desc: '',
      args: [],
    );
  }

  /// `you can use any payment method`
  String get rechangreWalletBody {
    return Intl.message(
      'you can use any payment method',
      name: 'rechangreWalletBody',
      desc: '',
      args: [],
    );
  }

  /// `These credentials are not found`
  String get noUserFound {
    return Intl.message(
      'These credentials are not found',
      name: 'noUserFound',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Postal Code`
  String get postalCode {
    return Intl.message(
      'Postal Code',
      name: 'postalCode',
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

  /// `You can add more than one address for more than branch`
  String get addressListTitle {
    return Intl.message(
      'You can add more than one address for more than branch',
      name: 'addressListTitle',
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

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get searchTitle {
    return Intl.message(
      'Search',
      name: 'searchTitle',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'search...' key

  /// `Help`
  String get helper {
    return Intl.message(
      'Help',
      name: 'helper',
      desc: '',
      args: [],
    );
  }

  /// `Send Missing Items Notebook....Important`
  String get sendNotebook {
    return Intl.message(
      'Send Missing Items Notebook....Important',
      name: 'sendNotebook',
      desc: '',
      args: [],
    );
  }

  /// `Stagnant Items.......You can upload your stagnant items to your account and they will be rotated and resold on your behalf`
  String get stagnantItems {
    return Intl.message(
      'Stagnant Items.......You can upload your stagnant items to your account and they will be rotated and resold on your behalf',
      name: 'stagnantItems',
      desc: '',
      args: [],
    );
  }

  /// `Wallet......Here you can get money and cashback to help you increase your profits`
  String get wallet {
    return Intl.message(
      'Wallet......Here you can get money and cashback to help you increase your profits',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `Customer's Stagnant Items.....You can browse stagnant items at other pharmacies in your area and repurchase them`
  String get customerStagnantItems {
    return Intl.message(
      'Customer\'s Stagnant Items.....You can browse stagnant items at other pharmacies in your area and repurchase them',
      name: 'customerStagnantItems',
      desc: '',
      args: [],
    );
  }

  /// `Missing Items Notebook....You can upload a missing items sheet or an Excel sheet, and the orders will be processed automatically on your behalf`
  String get missingItemsNotebook {
    return Intl.message(
      'Missing Items Notebook....You can upload a missing items sheet or an Excel sheet, and the orders will be processed automatically on your behalf',
      name: 'missingItemsNotebook',
      desc: '',
      args: [],
    );
  }

  /// `Expired Products or Expired Items.......Dispose of expired items by uploading expired or damaged products`
  String get expiredProducts {
    return Intl.message(
      'Expired Products or Expired Items.......Dispose of expired items by uploading expired or damaged products',
      name: 'expiredProducts',
      desc: '',
      args: [],
    );
  }

  /// `Return Order....You can return an item within 3 days after receiving it`
  String get returnOrder {
    return Intl.message(
      'Return Order....You can return an item within 3 days after receiving it',
      name: 'returnOrder',
      desc: '',
      args: [],
    );
  }

  /// `My Favorite Items.....What you want to buy later`
  String get favoriteItems {
    return Intl.message(
      'My Favorite Items.....What you want to buy later',
      name: 'favoriteItems',
      desc: '',
      args: [],
    );
  }

  /// `Add Address`
  String get addNewAddress {
    return Intl.message(
      'Add Address',
      name: 'addNewAddress',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `i am here to help you around the whole app`
  String get onbordingMsg {
    return Intl.message(
      'i am here to help you around the whole app',
      name: 'onbordingMsg',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `en`
  String get localeee {
    return Intl.message(
      'en',
      name: 'localeee',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Address`
  String get confirmAddress {
    return Intl.message(
      'Confirm Address',
      name: 'confirmAddress',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get choosePaymentMethod {
    return Intl.message(
      'Payment Method',
      name: 'choosePaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Cash on Delivery`
  String get cashOnDelivery {
    return Intl.message(
      'Cash on Delivery',
      name: 'cashOnDelivery',
      desc: '',
      args: [],
    );
  }

  /// `You will pay when you receive the order`
  String get cashOnDeliverydes {
    return Intl.message(
      'You will pay when you receive the order',
      name: 'cashOnDeliverydes',
      desc: '',
      args: [],
    );
  }

  /// `pay from your wallet balance`
  String get walletCacheDes {
    return Intl.message(
      'pay from your wallet balance',
      name: 'walletCacheDes',
      desc: '',
      args: [],
    );
  }

  /// `pay using your credit card `
  String get creditCarddes {
    return Intl.message(
      'pay using your credit card ',
      name: 'creditCarddes',
      desc: '',
      args: [],
    );
  }

  /// `buy now and buy later `
  String get delayedCashDes {
    return Intl.message(
      'buy now and buy later ',
      name: 'delayedCashDes',
      desc: '',
      args: [],
    );
  }

  /// `Credit Card`
  String get creditCard {
    return Intl.message(
      'Credit Card',
      name: 'creditCard',
      desc: '',
      args: [],
    );
  }

  /// `Delayed Cash`
  String get delayedCash {
    return Intl.message(
      'Delayed Cash',
      name: 'delayedCash',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Doctor `
  String get welcomeMessage {
    return Intl.message(
      'Welcome Doctor ',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Cash on Delivery Screen`
  String get cashOnDeliveryScreen {
    return Intl.message(
      'Cash on Delivery Screen',
      name: 'cashOnDeliveryScreen',
      desc: '',
      args: [],
    );
  }

  /// `Credit Card Payment Screen`
  String get creditCardPaymentScreen {
    return Intl.message(
      'Credit Card Payment Screen',
      name: 'creditCardPaymentScreen',
      desc: '',
      args: [],
    );
  }

  /// `Delayed Cash Payment Screen`
  String get delayedCashScreen {
    return Intl.message(
      'Delayed Cash Payment Screen',
      name: 'delayedCashScreen',
      desc: '',
      args: [],
    );
  }

  /// `You have 30 days to repay the debt`
  String get delayedCashScreenDesTime {
    return Intl.message(
      'You have 30 days to repay the debt',
      name: 'delayedCashScreenDesTime',
      desc: '',
      args: [],
    );
  }

  /// `Change the language of the application`
  String get languageDes {
    return Intl.message(
      'Change the language of the application',
      name: 'languageDes',
      desc: '',
      args: [],
    );
  }

  /// `Make Changes to your profile Info`
  String get profileInfoDes {
    return Intl.message(
      'Make Changes to your profile Info',
      name: 'profileInfoDes',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get aboutApp {
    return Intl.message(
      'About us',
      name: 'aboutApp',
      desc: '',
      args: [],
    );
  }

  /// ` you can take a look on our newest digital services `
  String get medicalServices {
    return Intl.message(
      ' you can take a look on our newest digital services ',
      name: 'medicalServices',
      desc: '',
      args: [],
    );
  }

  /// `you can speak to a specialist`
  String get speakToUs {
    return Intl.message(
      'you can speak to a specialist',
      name: 'speakToUs',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
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

  /// `conect with us for varification `
  String get verification_status {
    return Intl.message(
      'conect with us for varification ',
      name: 'verification_status',
      desc: '',
      args: [],
    );
  }

  /// `Select Quantitiy at First`
  String get selectQuantitiy {
    return Intl.message(
      'Select Quantitiy at First',
      name: 'selectQuantitiy',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get refused {
    return Intl.message(
      'Pending',
      name: 'refused',
      desc: '',
      args: [],
    );
  }

  /// ` please enter valid email `
  String get invalidEmail {
    return Intl.message(
      ' please enter valid email ',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Compare Price`
  String get comparePrice {
    return Intl.message(
      'Compare Price',
      name: 'comparePrice',
      desc: '',
      args: [],
    );
  }

  /// `discont`
  String get discont {
    return Intl.message(
      'discont',
      name: 'discont',
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

  /// `Cash Back`
  String get cashBack {
    return Intl.message(
      'Cash Back',
      name: 'cashBack',
      desc: '',
      args: [],
    );
  }

  /// `you have : `
  String get youHave {
    return Intl.message(
      'you have : ',
      name: 'youHave',
      desc: '',
      args: [],
    );
  }

  /// `The password cant be less than 4 `
  String get passwordTooShort {
    return Intl.message(
      'The password cant be less than 4 ',
      name: 'passwordTooShort',
      desc: '',
      args: [],
    );
  }

  /// `You Can Convert Your Points To :  `
  String get contvertTo {
    return Intl.message(
      'You Can Convert Your Points To :  ',
      name: 'contvertTo',
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

  /// `Confirm Payment`
  String get confirmPayment {
    return Intl.message(
      'Confirm Payment',
      name: 'confirmPayment',
      desc: '',
      args: [],
    );
  }

  /// `Continue Payment`
  String get continuePayment {
    return Intl.message(
      'Continue Payment',
      name: 'continuePayment',
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

  /// `Size`
  String get size {
    return Intl.message(
      'Size',
      name: 'size',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Today Sale`
  String get flashTodaySale {
    return Intl.message(
      'Today Sale',
      name: 'flashTodaySale',
      desc: '',
      args: [],
    );
  }

  /// `Color`
  String get color {
    return Intl.message(
      'Color',
      name: 'color',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get pound {
    return Intl.message(
      'EGP',
      name: 'pound',
      desc: '',
      args: [],
    );
  }

  /// `Shipping Address`
  String get address {
    return Intl.message(
      'Shipping Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Welcome ,doctor `
  String get loginTitle {
    return Intl.message(
      'Welcome ,doctor ',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy a Shipping experiment with Duaya`
  String get loginBody {
    return Intl.message(
      'Enjoy a Shipping experiment with Duaya',
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

  /// `expiry date of drugs`
  String get expiryDate {
    return Intl.message(
      'expiry date of drugs',
      name: 'expiryDate',
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

  /// `Address Details`
  String get addressDetails {
    return Intl.message(
      'Address Details',
      name: 'addressDetails',
      desc: '',
      args: [],
    );
  }

  /// `Last Address`
  String get lastAddress {
    return Intl.message(
      'Last Address',
      name: 'lastAddress',
      desc: '',
      args: [],
    );
  }

  /// `Pay with Last Address`
  String get payWithLastAddress {
    return Intl.message(
      'Pay with Last Address',
      name: 'payWithLastAddress',
      desc: '',
      args: [],
    );
  }

  /// `Save and Pay`
  String get saveAndPay {
    return Intl.message(
      'Save and Pay',
      name: 'saveAndPay',
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

  /// `New Client`
  String get newCilent {
    return Intl.message(
      'New Client',
      name: 'newCilent',
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

  /// `Edit The Product`
  String get editProduct {
    return Intl.message(
      'Edit The Product',
      name: 'editProduct',
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

  /// `Save`
  String get saveChanges {
    return Intl.message(
      'Save',
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

  /// ` Send Short Coming Book `
  String get sendMyShortComingBook {
    return Intl.message(
      ' Send Short Coming Book ',
      name: 'sendMyShortComingBook',
      desc: '',
      args: [],
    );
  }

  /// `Enter the name of the `
  String get addWorkName {
    return Intl.message(
      'Enter the name of the ',
      name: 'addWorkName',
      desc: '',
      args: [],
    );
  }

  /// `Please Upload the photo of`
  String get addPhotoOf {
    return Intl.message(
      'Please Upload the photo of',
      name: 'addPhotoOf',
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

  /// `your can review your previous orders`
  String get myOrderSpeak {
    return Intl.message(
      'your can review your previous orders',
      name: 'myOrderSpeak',
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

  /// `Fefund Request Details`
  String get returnDetailsRequest {
    return Intl.message(
      'Fefund Request Details',
      name: 'returnDetailsRequest',
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

  /// `refund item`
  String get sendItem {
    return Intl.message(
      'refund item',
      name: 'sendItem',
      desc: '',
      args: [],
    );
  }

  /// `send Product`
  String get sendProduct {
    return Intl.message(
      'send Product',
      name: 'sendProduct',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Again`
  String get letsStart {
    return Intl.message(
      'Welcome Again',
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

  /// `My Short Coming Book`
  String get ShortComing {
    return Intl.message(
      'My Short Coming Book',
      name: 'ShortComing',
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

  /// `Duaya SoftWare`
  String get medicalService {
    return Intl.message(
      'Duaya SoftWare',
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

  /// `Security and Login Features`
  String get security_and_login {
    return Intl.message(
      'Security and Login Features',
      name: 'security_and_login',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to enable login via email?`
  String get email_login {
    return Intl.message(
      'Do you want to enable login via email?',
      name: 'email_login',
      desc: '',
      args: [],
    );
  }

  /// `Would you prefer to log in using social media accounts (like Google or Facebook)?`
  String get social_login {
    return Intl.message(
      'Would you prefer to log in using social media accounts (like Google or Facebook)?',
      name: 'social_login',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to use fingerprint or face recognition for login?`
  String get biometric_login {
    return Intl.message(
      'Do you want to use fingerprint or face recognition for login?',
      name: 'biometric_login',
      desc: '',
      args: [],
    );
  }

  /// `Chat and Communication`
  String get chat_and_communication {
    return Intl.message(
      'Chat and Communication',
      name: 'chat_and_communication',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to enable chat with other users or support team?`
  String get enable_chat {
    return Intl.message(
      'Do you want to enable chat with other users or support team?',
      name: 'enable_chat',
      desc: '',
      args: [],
    );
  }

  /// `Do you need instant notifications for new messages?`
  String get message_notifications {
    return Intl.message(
      'Do you need instant notifications for new messages?',
      name: 'message_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to use voice messages in chat?`
  String get voice_messages {
    return Intl.message(
      'Do you want to use voice messages in chat?',
      name: 'voice_messages',
      desc: '',
      args: [],
    );
  }

  /// `Customization`
  String get customization {
    return Intl.message(
      'Customization',
      name: 'customization',
      desc: '',
      args: [],
    );
  }

  /// `Would you like to enable dark mode?`
  String get dark_mode {
    return Intl.message(
      'Would you like to enable dark mode?',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Do you prefer to customize the font size in the app?`
  String get font_size {
    return Intl.message(
      'Do you prefer to customize the font size in the app?',
      name: 'font_size',
      desc: '',
      args: [],
    );
  }

  /// `Would you like to change the app's interface colors according to your preferences?`
  String get theme_colors {
    return Intl.message(
      'Would you like to change the app\'s interface colors according to your preferences?',
      name: 'theme_colors',
      desc: '',
      args: [],
    );
  }

  /// `Notifications and Alerts`
  String get notifications_and_alerts {
    return Intl.message(
      'Notifications and Alerts',
      name: 'notifications_and_alerts',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to receive notifications about updates or new messages?`
  String get receive_notifications {
    return Intl.message(
      'Do you want to receive notifications about updates or new messages?',
      name: 'receive_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Would you prefer to customize the types of notifications you receive (such as news, alerts, offers)?`
  String get custom_notifications {
    return Intl.message(
      'Would you prefer to customize the types of notifications you receive (such as news, alerts, offers)?',
      name: 'custom_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Payment and Shopping`
  String get payment_and_shopping {
    return Intl.message(
      'Payment and Shopping',
      name: 'payment_and_shopping',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to enable electronic payment methods in the app?`
  String get enable_payment {
    return Intl.message(
      'Do you want to enable electronic payment methods in the app?',
      name: 'enable_payment',
      desc: '',
      args: [],
    );
  }

  /// `Do you need the feature to save payment details for future purchases?`
  String get save_payment_details {
    return Intl.message(
      'Do you need the feature to save payment details for future purchases?',
      name: 'save_payment_details',
      desc: '',
      args: [],
    );
  }

  /// `Location and Maps`
  String get location_and_maps {
    return Intl.message(
      'Location and Maps',
      name: 'location_and_maps',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to enable location-based services?`
  String get enable_location {
    return Intl.message(
      'Do you want to enable location-based services?',
      name: 'enable_location',
      desc: '',
      args: [],
    );
  }

  /// `Would you like to use maps to find services or specific locations?`
  String get use_maps {
    return Intl.message(
      'Would you like to use maps to find services or specific locations?',
      name: 'use_maps',
      desc: '',
      args: [],
    );
  }

  /// `Multimedia Features`
  String get multimedia_features {
    return Intl.message(
      'Multimedia Features',
      name: 'multimedia_features',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to add a feature to upload photos or videos?`
  String get upload_media {
    return Intl.message(
      'Do you want to add a feature to upload photos or videos?',
      name: 'upload_media',
      desc: '',
      args: [],
    );
  }

  /// `Do you need the ability to edit photos or videos within the app?`
  String get edit_media {
    return Intl.message(
      'Do you need the ability to edit photos or videos within the app?',
      name: 'edit_media',
      desc: '',
      args: [],
    );
  }

  /// `Sharing Features`
  String get sharing_features {
    return Intl.message(
      'Sharing Features',
      name: 'sharing_features',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to enable content sharing on social media platforms?`
  String get share_on_social_media {
    return Intl.message(
      'Do you want to enable content sharing on social media platforms?',
      name: 'share_on_social_media',
      desc: '',
      args: [],
    );
  }

  /// `Would you prefer the ability to share content via SMS or email?`
  String get share_via_sms {
    return Intl.message(
      'Would you prefer the ability to share content via SMS or email?',
      name: 'share_via_sms',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Settings`
  String get privacy_settings {
    return Intl.message(
      'Privacy Settings',
      name: 'privacy_settings',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to control who can see your personal information?`
  String get control_visibility {
    return Intl.message(
      'Do you want to control who can see your personal information?',
      name: 'control_visibility',
      desc: '',
      args: [],
    );
  }

  /// `Do you need additional settings to manage your data and information within the app?`
  String get manage_data {
    return Intl.message(
      'Do you need additional settings to manage your data and information within the app?',
      name: 'manage_data',
      desc: '',
      args: [],
    );
  }

  /// `User Interface Customization`
  String get ui_customization {
    return Intl.message(
      'User Interface Customization',
      name: 'ui_customization',
      desc: '',
      args: [],
    );
  }

  /// `Would you like to customize the home screen based on your favorite usage?`
  String get customize_home {
    return Intl.message(
      'Would you like to customize the home screen based on your favorite usage?',
      name: 'customize_home',
      desc: '',
      args: [],
    );
  }

  /// `Do you prefer to display a shortcut list for quick access to important features?`
  String get quick_access_list {
    return Intl.message(
      'Do you prefer to display a shortcut list for quick access to important features?',
      name: 'quick_access_list',
      desc: '',
      args: [],
    );
  }

  /// `User Profile & Medical History`
  String get user_profile_medical_history {
    return Intl.message(
      'User Profile & Medical History',
      name: 'user_profile_medical_history',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to create a detailed medical profile including age, gender, and medical history?`
  String get create_medical_profile {
    return Intl.message(
      'Do you want to create a detailed medical profile including age, gender, and medical history?',
      name: 'create_medical_profile',
      desc: '',
      args: [],
    );
  }

  /// `Would you like to store previous diagnoses, treatments, or ongoing medical conditions?`
  String get store_medical_history {
    return Intl.message(
      'Would you like to store previous diagnoses, treatments, or ongoing medical conditions?',
      name: 'store_medical_history',
      desc: '',
      args: [],
    );
  }

  /// `Appointment Scheduling`
  String get appointment_scheduling {
    return Intl.message(
      'Appointment Scheduling',
      name: 'appointment_scheduling',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to enable users to book appointments with doctors directly from the app?`
  String get book_appointments {
    return Intl.message(
      'Do you want to enable users to book appointments with doctors directly from the app?',
      name: 'book_appointments',
      desc: '',
      args: [],
    );
  }

  /// `Would you prefer to include an appointment reminder feature?`
  String get appointment_reminders {
    return Intl.message(
      'Would you prefer to include an appointment reminder feature?',
      name: 'appointment_reminders',
      desc: '',
      args: [],
    );
  }

  /// `Doctor-Patient Communication`
  String get doctor_patient_communication {
    return Intl.message(
      'Doctor-Patient Communication',
      name: 'doctor_patient_communication',
      desc: '',
      args: [],
    );
  }

  /// `Would you like to enable secure messaging between doctors and patients?`
  String get enable_secure_messaging {
    return Intl.message(
      'Would you like to enable secure messaging between doctors and patients?',
      name: 'enable_secure_messaging',
      desc: '',
      args: [],
    );
  }

  /// `Do you need the ability to have video consultations with doctors?`
  String get video_consultations {
    return Intl.message(
      'Do you need the ability to have video consultations with doctors?',
      name: 'video_consultations',
      desc: '',
      args: [],
    );
  }

  /// `Prescription Management`
  String get prescription_management {
    return Intl.message(
      'Prescription Management',
      name: 'prescription_management',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to allow doctors to issue electronic prescriptions to patients?`
  String get electronic_prescriptions {
    return Intl.message(
      'Do you want to allow doctors to issue electronic prescriptions to patients?',
      name: 'electronic_prescriptions',
      desc: '',
      args: [],
    );
  }

  /// `Would you like patients to receive reminders for taking medications or refilling prescriptions?`
  String get medication_reminders {
    return Intl.message(
      'Would you like patients to receive reminders for taking medications or refilling prescriptions?',
      name: 'medication_reminders',
      desc: '',
      args: [],
    );
  }

  /// `Health Monitoring & Wearables Integration`
  String get health_monitoring {
    return Intl.message(
      'Health Monitoring & Wearables Integration',
      name: 'health_monitoring',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to integrate wearable devices for real-time health monitoring?`
  String get integrate_wearables {
    return Intl.message(
      'Do you want to integrate wearable devices for real-time health monitoring?',
      name: 'integrate_wearables',
      desc: '',
      args: [],
    );
  }

  /// `Would you like users to track vital signs like heart rate, blood pressure, or glucose levels?`
  String get track_vital_signs {
    return Intl.message(
      'Would you like users to track vital signs like heart rate, blood pressure, or glucose levels?',
      name: 'track_vital_signs',
      desc: '',
      args: [],
    );
  }

  /// `Telemedicine Features`
  String get telemedicine {
    return Intl.message(
      'Telemedicine Features',
      name: 'telemedicine',
      desc: '',
      args: [],
    );
  }

  /// `Would you like to offer remote video consultations with doctors?`
  String get remote_consultations {
    return Intl.message(
      'Would you like to offer remote video consultations with doctors?',
      name: 'remote_consultations',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to include a virtual triage system for assessing symptoms before consultations?`
  String get virtual_triage {
    return Intl.message(
      'Do you want to include a virtual triage system for assessing symptoms before consultations?',
      name: 'virtual_triage',
      desc: '',
      args: [],
    );
  }

  /// `Lab Test Results`
  String get lab_test_results {
    return Intl.message(
      'Lab Test Results',
      name: 'lab_test_results',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to enable patients to receive lab results directly in the app?`
  String get receive_lab_results {
    return Intl.message(
      'Do you want to enable patients to receive lab results directly in the app?',
      name: 'receive_lab_results',
      desc: '',
      args: [],
    );
  }

  /// `Would you prefer to notify patients when their lab results are available?`
  String get lab_results_notifications {
    return Intl.message(
      'Would you prefer to notify patients when their lab results are available?',
      name: 'lab_results_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Health Articles & Education`
  String get health_articles {
    return Intl.message(
      'Health Articles & Education',
      name: 'health_articles',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to offer educational content such as articles or videos about health conditions and treatments?`
  String get offer_health_articles {
    return Intl.message(
      'Do you want to offer educational content such as articles or videos about health conditions and treatments?',
      name: 'offer_health_articles',
      desc: '',
      args: [],
    );
  }

  /// `Would you prefer to personalize health tips based on user profiles?`
  String get personalize_health_tips {
    return Intl.message(
      'Would you prefer to personalize health tips based on user profiles?',
      name: 'personalize_health_tips',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Integration`
  String get insurance_integration {
    return Intl.message(
      'Insurance Integration',
      name: 'insurance_integration',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to allow users to link their health insurance for seamless billing?`
  String get link_health_insurance {
    return Intl.message(
      'Do you want to allow users to link their health insurance for seamless billing?',
      name: 'link_health_insurance',
      desc: '',
      args: [],
    );
  }

  /// `Would you prefer to display insurance coverage details for specific treatments or medications?`
  String get display_coverage_details {
    return Intl.message(
      'Would you prefer to display insurance coverage details for specific treatments or medications?',
      name: 'display_coverage_details',
      desc: '',
      args: [],
    );
  }

  /// `Emergency Contact & Services`
  String get emergency_services {
    return Intl.message(
      'Emergency Contact & Services',
      name: 'emergency_services',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to enable users to call emergency services directly from the app?`
  String get call_emergency_services {
    return Intl.message(
      'Do you want to enable users to call emergency services directly from the app?',
      name: 'call_emergency_services',
      desc: '',
      args: [],
    );
  }

  /// `Would you like to allow users to store emergency contact details for doctors or family?`
  String get store_emergency_contacts {
    return Intl.message(
      'Would you like to allow users to store emergency contact details for doctors or family?',
      name: 'store_emergency_contacts',
      desc: '',
      args: [],
    );
  }

  /// `Choose Your App Features`
  String get Appfeatures {
    return Intl.message(
      'Choose Your App Features',
      name: 'Appfeatures',
      desc: '',
      args: [],
    );
  }

  /// `Symptom Checker`
  String get symptom_checker {
    return Intl.message(
      'Symptom Checker',
      name: 'symptom_checker',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to provide a symptom checker for users to assess their conditions?`
  String get provide_symptom_checker {
    return Intl.message(
      'Do you want to provide a symptom checker for users to assess their conditions?',
      name: 'provide_symptom_checker',
      desc: '',
      args: [],
    );
  }

  /// `Would you like to offer suggestions for when to seek medical help based on symptoms?`
  String get offer_medical_help_suggestions {
    return Intl.message(
      'Would you like to offer suggestions for when to seek medical help based on symptoms?',
      name: 'offer_medical_help_suggestions',
      desc: '',
      args: [],
    );
  }

  /// `Health Goals & Tracking`
  String get health_goals_tracking {
    return Intl.message(
      'Health Goals & Tracking',
      name: 'health_goals_tracking',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to allow users to set and track health goals, such as weight loss or exercise targets?`
  String get set_health_goals {
    return Intl.message(
      'Do you want to allow users to set and track health goals, such as weight loss or exercise targets?',
      name: 'set_health_goals',
      desc: '',
      args: [],
    );
  }

  /// `Would you prefer to include progress tracking for these health goals?`
  String get track_health_goals_progress {
    return Intl.message(
      'Would you prefer to include progress tracking for these health goals?',
      name: 'track_health_goals_progress',
      desc: '',
      args: [],
    );
  }

  /// `Send To Duaya Team`
  String get sendToDuaya {
    return Intl.message(
      'Send To Duaya Team',
      name: 'sendToDuaya',
      desc: '',
      args: [],
    );
  }

  /// `By Wallet`
  String get walletByPayment {
    return Intl.message(
      'By Wallet',
      name: 'walletByPayment',
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

  /// `Please upload a picture of your`
  String get msgImage2 {
    return Intl.message(
      'Please upload a picture of your',
      name: 'msgImage2',
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

  /// `Add More Features not included`
  String get addMoreFeats {
    return Intl.message(
      'Add More Features not included',
      name: 'addMoreFeats',
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

  /// `services`
  String get services {
    return Intl.message(
      'services',
      name: 'services',
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

  /// `you can use the AI features`
  String get onboardingTitle2 {
    return Intl.message(
      'you can use the AI features',
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

  /// `To help you to know Duaya Pros`
  String get onboardingBody2 {
    return Intl.message(
      'To help you to know Duaya Pros',
      name: 'onboardingBody2',
      desc: '',
      args: [],
    );
  }

  /// `By providing all needs `
  String get onboardingBody3 {
    return Intl.message(
      'By providing all needs ',
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
