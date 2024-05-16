/// data : {"id":634,"user_id":2934,"name":"الصفوة ميديكال","title":null,"is_affiliate":0,"affiliate_verification":true,"description":null,"delivery_pickup_latitude":null,"delivery_pickup_longitude":null,"logo":"https://doctorpharmaco.com/public/assets/img/placeholder.jpg","package_invalid_at":"","product_upload_limit":0,"seller_package":"","seller_package_img":"https://doctorpharmaco.com/public/assets/img/placeholder.jpg","upload_id":null,"sliders":["https://doctorpharmaco.com/public/assets/img/placeholder.jpg"],"sliders_id":null,"address":"منيا القمح","admin_to_pay":"ج.م0.00","phone":"01025609594","facebook":null,"google":null,"twitter":null,"instagram":null,"youtube":null,"cash_on_delivery_status":0,"bank_payment_status":0,"bank_name":null,"bank_acc_name":null,"bank_acc_no":null,"bank_routing_no":null,"rating":0,"verified":true,"verified_img":"https://doctorpharmaco.com/public/assets/img/verified.png","verify_text":"Verified seller","email":"harbymr22@gmail.com","products":0,"orders":0,"sales":"ج.م0.00"}
/// success : true
/// status : 200

class CompanyModel {
  CompanyModel({
    this.data,
    this.success,
    this.status,
  });

  CompanyModel.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    success = json['success'];
    status = json['status'];
  }
  Data? data;
  bool? success;
  num? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['success'] = success;
    map['status'] = status;
    return map;
  }
}

/// id : 634
/// user_id : 2934
/// name : "الصفوة ميديكال"
/// title : null
/// is_affiliate : 0
/// affiliate_verification : true
/// description : null
/// delivery_pickup_latitude : null
/// delivery_pickup_longitude : null
/// logo : "https://doctorpharmaco.com/public/assets/img/placeholder.jpg"
/// package_invalid_at : ""
/// product_upload_limit : 0
/// seller_package : ""
/// seller_package_img : "https://doctorpharmaco.com/public/assets/img/placeholder.jpg"
/// upload_id : null
/// sliders : ["https://doctorpharmaco.com/public/assets/img/placeholder.jpg"]
/// sliders_id : null
/// address : "منيا القمح"
/// admin_to_pay : "ج.م0.00"
/// phone : "01025609594"
/// facebook : null
/// google : null
/// twitter : null
/// instagram : null
/// youtube : null
/// cash_on_delivery_status : 0
/// bank_payment_status : 0
/// bank_name : null
/// bank_acc_name : null
/// bank_acc_no : null
/// bank_routing_no : null
/// rating : 0
/// verified : true
/// verified_img : "https://doctorpharmaco.com/public/assets/img/verified.png"
/// verify_text : "Verified seller"
/// email : "harbymr22@gmail.com"
/// products : 0
/// orders : 0
/// sales : "ج.م0.00"

class Data {
  Data({
    this.id,
    this.userId,
    this.name,
    this.title,
    this.isAffiliate,
    this.affiliateVerification,
    this.description,
    this.deliveryPickupLatitude,
    this.deliveryPickupLongitude,
    this.logo,
    this.packageInvalidAt,
    this.productUploadLimit,
    this.sellerPackage,
    this.sellerPackageImg,
    this.uploadId,
    this.sliders,
    this.slidersId,
    this.address,
    this.adminToPay,
    this.phone,
    this.facebook,
    this.google,
    this.twitter,
    this.instagram,
    this.youtube,
    this.cashOnDeliveryStatus,
    this.bankPaymentStatus,
    this.bankName,
    this.bankAccName,
    this.bankAccNo,
    this.bankRoutingNo,
    this.rating,
    this.verified,
    this.verifiedImg,
    this.verifyText,
    this.email,
    this.products,
    this.orders,
    this.sales,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    title = json['title'];
    isAffiliate = json['is_affiliate'];
    affiliateVerification = json['affiliate_verification'];
    description = json['description'];
    deliveryPickupLatitude = json['delivery_pickup_latitude'];
    deliveryPickupLongitude = json['delivery_pickup_longitude'];
    logo = json['logo'];
    packageInvalidAt = json['package_invalid_at'];
    productUploadLimit = json['product_upload_limit'];
    sellerPackage = json['seller_package'];
    sellerPackageImg = json['seller_package_img'];
    uploadId = json['upload_id'];
    sliders = json['sliders'] != null ? json['sliders'].cast<String>() : [];
    slidersId = json['sliders_id'];
    address = json['address'];
    adminToPay = json['admin_to_pay'];
    phone = json['phone'];
    facebook = json['facebook'];
    google = json['google'];
    twitter = json['twitter'];
    instagram = json['instagram'];
    youtube = json['youtube'];
    cashOnDeliveryStatus = json['cash_on_delivery_status'];
    bankPaymentStatus = json['bank_payment_status'];
    bankName = json['bank_name'];
    bankAccName = json['bank_acc_name'];
    bankAccNo = json['bank_acc_no'];
    bankRoutingNo = json['bank_routing_no'];
    rating = json['rating'];
    verified = json['verified'];
    verifiedImg = json['verified_img'];
    verifyText = json['verify_text'];
    email = json['email'];
    products = json['products'];
    orders = json['orders'];
    sales = json['sales'];
  }
  num? id;
  num? userId;
  String? name;
  dynamic title;
  num? isAffiliate;
  bool? affiliateVerification;
  dynamic description;
  dynamic deliveryPickupLatitude;
  dynamic deliveryPickupLongitude;
  String? logo;
  String? packageInvalidAt;
  num? productUploadLimit;
  String? sellerPackage;
  String? sellerPackageImg;
  dynamic uploadId;
  List<String>? sliders;
  dynamic slidersId;
  String? address;
  String? adminToPay;
  String? phone;
  dynamic facebook;
  dynamic google;
  dynamic twitter;
  dynamic instagram;
  dynamic youtube;
  num? cashOnDeliveryStatus;
  num? bankPaymentStatus;
  dynamic bankName;
  dynamic bankAccName;
  dynamic bankAccNo;
  dynamic bankRoutingNo;
  num? rating;
  bool? verified;
  String? verifiedImg;
  String? verifyText;
  String? email;
  num? products;
  num? orders;
  String? sales;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['name'] = name;
    map['title'] = title;
    map['is_affiliate'] = isAffiliate;
    map['affiliate_verification'] = affiliateVerification;
    map['description'] = description;
    map['delivery_pickup_latitude'] = deliveryPickupLatitude;
    map['delivery_pickup_longitude'] = deliveryPickupLongitude;
    map['logo'] = logo;
    map['package_invalid_at'] = packageInvalidAt;
    map['product_upload_limit'] = productUploadLimit;
    map['seller_package'] = sellerPackage;
    map['seller_package_img'] = sellerPackageImg;
    map['upload_id'] = uploadId;
    map['sliders'] = sliders;
    map['sliders_id'] = slidersId;
    map['address'] = address;
    map['admin_to_pay'] = adminToPay;
    map['phone'] = phone;
    map['facebook'] = facebook;
    map['google'] = google;
    map['twitter'] = twitter;
    map['instagram'] = instagram;
    map['youtube'] = youtube;
    map['cash_on_delivery_status'] = cashOnDeliveryStatus;
    map['bank_payment_status'] = bankPaymentStatus;
    map['bank_name'] = bankName;
    map['bank_acc_name'] = bankAccName;
    map['bank_acc_no'] = bankAccNo;
    map['bank_routing_no'] = bankRoutingNo;
    map['rating'] = rating;
    map['verified'] = verified;
    map['verified_img'] = verifiedImg;
    map['verify_text'] = verifyText;
    map['email'] = email;
    map['products'] = products;
    map['orders'] = orders;
    map['sales'] = sales;
    return map;
  }
}
