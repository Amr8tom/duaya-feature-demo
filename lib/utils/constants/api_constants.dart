class URL {
  static const base = 'https://doctorpharmaco.com/';
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
  static const listCartItems = '${baseUrl}carts';
  static const checkOut = '${baseUrl}order/store';
  static const cartCount = '${baseUrl}cart-count';
  static const summary = '${baseUrl}cart-summary';
  static const register = '${baseUrl}auth/signup';
  static const bestSellers = '${baseUrl}products/best-seller';
  static const product = '${baseUrl}products/';
  static const search = '${baseUrl}products/search?name=';
  static const flasDeal = '${baseUrl}flash-deals';
  static const todayDeals = '${baseUrl}products/todays-deal';
  static const categoriesByPageBycity = '${baseUrl}filter/categories';
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
  static const sliders = '${baseUrl}sliders';
  static const checkOTPUrl = 'api/provider/check-phone';
  static const verifyOTPUrl = 'api/provider/verify';
  static const generateOTPUrl = 'api/provider/generate-otp';
  static const updatePasswordUrl = 'api/provider/reset-password';
}
