class URL {
  // static const base = 'https://doctorpharmaco.com/';
  static const base = 'https://duaya.net/';
  static const baseUrl = '${base}api/v2/';

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
  // "https://doctorpharmaco.com/api/v2/carts/change-quantity"
  // {
  // "id":"23185",
  // "quantity":"5"
  //
  // }
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
  static const cartCount = '${baseUrl}cart-count';
  static const summary = '${baseUrl}cart-summary';
  static const register = '${baseUrl}auth/signup';
  static const bestSellers = '${baseUrl}products/best-seller';
  static const product = '${baseUrl}products/';
  static const relatedProduct = '${baseUrl}products/related/by-name/';
  static const search = '${baseUrl}products/search?name=';
  static const flasDeal = '${baseUrl}flash-deals';
  static const todayDeals = '${baseUrl}products/todays-deal';
  static const categoriesByPageBycity = '${baseUrl}filter/categories';
  static const shortComing = '${baseUrl}shortcoming/store';
  // products/brand/76?page=1
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
  static const confirmResetPassword = '${baseUrl}auth/password/confirm_reset';
  static const resendCodeResetPassword = '${baseUrl}auth/password/resend_code';
  static const getUserByToken = '${baseUrl}get-user-by-access_token';
  /////////////////
  static const expiredList = '${baseUrl}expired_products/list';
  static const expiredCreate = '${baseUrl}expired_products/create';
  static const expiredUpdate = '${baseUrl}expired_products/update/';
  // '${baseUrl}expired_products/update/{id}';
  static const expiredDelete = '${baseUrl}expired_products/delete/';
  // '${baseUrl}expired_products/delete/{id}';
  static const sliders = '${baseUrl}sliders';
  static const createAddress = '${baseUrl}user/shipping/create';
  static const updateAddress = '${baseUrl}user/shipping/update';
  static const deleteAddress = '${baseUrl}user/shipping/delete/'; //{id}
  static const makeDefaultAddress = '${baseUrl}user/shipping/make_default';
  static const getAddressList = '${baseUrl}user/shipping/address';
  static const medicalServices = '${baseUrl}products/digital';
  static const countries = '${baseUrl}countries';
  static const profile = '${baseUrl}profile/counters';
  static const statiesByCityID =
      '${baseUrl}cities-by-state/'; // cities-by-state/{id}
  static const GetCitiesByCountryID =
      '${baseUrl}states-by-country/'; // states-by-country/{id} enterCountyid
  static const checkOTPUrl = 'api/provider/check-phone';
  static const verifyOTPUrl = 'api/provider/verify';
  static const generateOTPUrl = 'api/provider/generate-otp';
  static const updatePasswordUrl = 'api/provider/reset-password';
}
