class URL {
  static const base = 'https://doctorpharmaco.com/';
  static const baseUrl = '${base}api/v2/';
  static const fwaterkApi =
      'd6102ac782d0fa700a5d2c6265f47ccb1d760b88edd5c95790';
  static const fawaterk = 'https://app.fawaterk.com';
  static const fawaterkFail = 'https://doctorpharmaco.com/fawaterak/fail';
  static const fawaterkSuccess = 'https://doctorpharmaco.com/fawaterak/success';
  static const fawaterkPending = 'https://dev.fawaterk.com/pending';

  /// Authentication
  static const login = '${baseUrl}auth/login';
  static const privacyPolicy =
      'https://doctorpharmaco.com/mobile-page/privacy-policy';
  static const logout = '${baseUrl}auth/logout';
  static const cities = '${baseUrl}brands?page=';
  static const addToCart = '${baseUrl}carts/add';
  static const deleteCart =
      '${baseUrl}carts/'; ///////  {} the id of the cart here
  static const changeQuantitiy = '${baseUrl}carts/change-quantity';
  static const clubPointList = '${baseUrl}clubpoint/get-list';
  static const clubPointConvert = '${baseUrl}clubpoint/convert-into-wallet';
  static const listCartItems = '${baseUrl}carts';
  static const giftAndUserData = '${baseUrl}auth/user';
  static const logOut = '${baseUrl}logout';
  static const createChatConsevation = '${baseUrl}chat/create-conversation';
  static const getChatMassages = '${baseUrl}chat/messages/'; //{id}
  static const getnewMassages =
      '${baseUrl}chat/get-new-messages/'; //{conversation_id}/{last_message_id}
  static const getChatConsevation = '${baseUrl}chat/conversations';
  static const checkOut = '${baseUrl}order/store';
  static const walletHistory = '${baseUrl}wallet/history';
  static const walletBalance = '${baseUrl}wallet/balance';
  static const wishlist = '${baseUrl}wishlists';
  static const whilistAddItem = '${baseUrl}wishlists-add-product';
  static const whilistRemoveItem = '${baseUrl}wishlists-remove-product';
  static const whilistCheckItem = '${baseUrl}wishlists-check-product';
  static const cartCount = '${baseUrl}cart-count';
  static const summary = '${baseUrl}cart-summary';
  static const register = '${baseUrl}auth/signup';
  static const bestSellers = '${baseUrl}products/best-seller';
  static const product = '${baseUrl}products/';
  static const relatedProduct = '${baseUrl}products/related/by-name/';

  /// suggestions
  static const search = '${baseUrl}products/search?type=product?name=';
  static const searchSuggestions =
      '${baseUrl}get-search-suggestions?type=product&query_key=';

  /// type : "product"
  ///query_key :  الحاجه الي بيسيرش بيها
  ///$type == "sellers" لو سيرش عن شركات
  static const flasDeal = '${baseUrl}flash-deals';
  static const todayDeals = '${baseUrl}products/todays-deal';
  static const categoriesByPageBycity = '${baseUrl}filter/categories';
  static const shortComing = '${baseUrl}shortcoming/store';
  static const categoryByID = '${baseUrl}products/category/';
  static const companiesByPage = '${baseUrl}shops?page=';
  static const companyDetails =
      '${baseUrl}shops/details/'; //////////////////////
  static const companyProductsBestSeller =
      '${baseUrl}shops/products/top/'; //shops/products/top/{id}
  static const companyAllProducts =
      '${baseUrl}shops/products/all/'; //shops/products/all/{id}
  static const companyNewProducts =
      '${baseUrl}shops/products/new/'; //shops/products/new/{id}
  static const rsetPassword = '${baseUrl}auth/password/forget_request';

  ///  Authentication

  // {
  // "id":25444,
  // "reason":"i dont need it"
  // }

  static const sendRefundOrderRequest = '${baseUrl}refund-request/send';
  static const getAllRefundOrderRequest = '${baseUrl}refund-request/get-list';
  static const getAllOrders = '${baseUrl}purchase-history';
  static const getOrderDetails =
      '${baseUrl}purchase-history-details/'; //{OrderID}
  static const getOrderItems = '${baseUrl}purchase-history-items/'; //{OrderID}
  static const confirmResetPassword = '${baseUrl}auth/password/confirm_reset';
  static const resendCodeResetPassword = '${baseUrl}auth/password/resend_code';
  static const getUserByToken = '${baseUrl}get-user-by-access_token';
  /////////////////
  static const expiredList = '${baseUrl}expired_products/list';
  static const expiredCreate = '${baseUrl}expired_products/create';
  static const expiredUpdate = '${baseUrl}expired_products/update/';
  static const expiredDelete = '${baseUrl}expired_products/delete/';
  static const sliders = '${baseUrl}sliders';
  static const createAddress = '${baseUrl}user/shipping/create';
  static const updateAddress = '${baseUrl}user/shipping/update';
  static const deleteAddress = '${baseUrl}user/shipping/delete/'; //{id}
  static const makeDefaultAddress = '${baseUrl}user/shipping/make_default';
  static const updateAddressInCart = '${baseUrl}update-address-in-cart';
  static const getAddressList = '${baseUrl}user/shipping/address';
  static const medicalServices = '${baseUrl}products/digital';
  static const countries = '${baseUrl}countries';
  static const profile = '${baseUrl}profile/counters';
  static const updateProfile = '${baseUrl}profile/update';
  static const updateDeviceToken = '${baseUrl}profile/update-device-token';
  static const statiesByCityID =
      '${baseUrl}cities-by-state/'; // cities-by-state/{id}
  static const GetCitiesByCountryID =
      '${baseUrl}states-by-country/'; // states-by-country/{id} enterCountyid
  static const checkOTPUrl = 'api/provider/check-phone';
  static const verifyOTPUrl = 'api/provider/verify';

  /// coustomerAds
  static const customerAdsAdd = '${baseUrl}classified/store-products';
  static const customerMyAds = '${baseUrl}classified/own-products';
  static const customerAllAds = '${baseUrl}classified/all';
  static const customerAdsProductDetails =
      '${baseUrl}classified/product-details/'; //{id}
  static const customerAdsRelated =
      '${baseUrl}classified/related-products/'; //{id}
  static const generateOTPUrl = 'api/provider/generate-otp';
  static const updatePasswordUrl = 'api/provider/reset-password';
  static const agoraID = '00d26e5417db439ba61866b00d8e5909';
  static const agoraToken =
      '007eJxTYHj/7u5av2eLDoZf1Pm0rf7H7Ov1EdXdzHapH2b0s86fW2uvwGBgkGJklmpqYmiekmRibJmUaGZoYWaWBBS2SDW1NLDcHLworSGQkaF4lhUTIwMEgvicDCmliZWJIanFJQwMAPD3I6c=';
}
