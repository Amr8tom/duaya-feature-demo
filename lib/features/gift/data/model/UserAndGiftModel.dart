class UserAndGiftModel {
  UserAndGiftModel({
    this.id,
    this.referredBy,
    this.provider,
    this.providerId,
    this.refreshToken,
    this.accessToken,
    this.userType,
    this.customerType,
    this.isDoctor,
    this.isDelay,
    this.name,
    this.jobName,
    this.email,
    this.minAmount,
    this.delayBalance,
    this.emailVerifiedAt,
    this.verificationCode,
    this.newEmailVerificiationCode,
    this.deviceToken,
    this.avatar,
    this.avatarOriginal,
    this.licenseImg,
    this.address,
    this.country,
    this.brandId,
    this.city,
    this.region,
    this.postalCode,
    this.phone,
    this.balance,
    this.banned,
    this.referralCode,
    this.customerPackageId,
    this.remainingUploads,
    this.createdAt,
    this.updatedAt,
    this.verificationStatus,
    this.vipStatus,
    this.deviceType,
  });

  UserAndGiftModel.fromJson(dynamic json) {
    id = json['id'];
    referredBy = json['referred_by'];
    provider = json['provider'];
    providerId = json['provider_id'];
    refreshToken = json['refresh_token'];
    accessToken = json['access_token'];
    userType = json['user_type'];
    customerType = json['customer_type'];
    isDoctor = json['is_doctor'];
    isDelay = json['is_delay'];
    name = json['name'];
    jobName = json['job_name'];
    email = json['email'];
    minAmount = json['min_amount'];
    delayBalance = json['delay_balance'];
    emailVerifiedAt = json['email_verified_at'];
    verificationCode = json['verification_code'];
    newEmailVerificiationCode = json['new_email_verificiation_code'];
    deviceToken = json['device_token'];
    avatar = json['avatar'];
    avatarOriginal = json['avatar_original'];
    licenseImg = json['license_img'];
    address = json['address'];
    country = json['country'];
    brandId = json['brand_id'];
    city = json['city'];
    region = json['region'];
    postalCode = json['postal_code'];
    phone = json['phone'];
    balance = json['balance'];
    banned = json['banned'];
    referralCode = json['referral_code'];
    customerPackageId = json['customer_package_id'];
    remainingUploads = json['remaining_uploads'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    verificationStatus = json['verification_status'];
    vipStatus = json['vip_status'];
    deviceType = json['device_type'];
  }
  int? id;
  dynamic referredBy;
  dynamic provider;
  dynamic providerId;
  dynamic refreshToken;
  dynamic accessToken;
  String? userType;
  String? customerType;
  int? isDoctor;
  int? isDelay;
  String? name;
  String? jobName;
  String? email;
  int? minAmount;
  int? delayBalance;
  String? emailVerifiedAt;
  dynamic verificationCode;
  dynamic newEmailVerificiationCode;
  String? deviceToken;
  dynamic avatar;
  dynamic avatarOriginal;
  String? licenseImg;
  dynamic address;
  dynamic country;
  String? brandId;
  dynamic city;
  dynamic region;
  dynamic postalCode;
  String? phone;
  int? balance;
  int? banned;
  dynamic referralCode;
  dynamic customerPackageId;
  int? remainingUploads;
  String? createdAt;
  String? updatedAt;
  int? verificationStatus;
  int? vipStatus;
  String? deviceType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['referred_by'] = referredBy;
    map['provider'] = provider;
    map['provider_id'] = providerId;
    map['refresh_token'] = refreshToken;
    map['access_token'] = accessToken;
    map['user_type'] = userType;
    map['customer_type'] = customerType;
    map['is_doctor'] = isDoctor;
    map['is_delay'] = isDelay;
    map['name'] = name;
    map['job_name'] = jobName;
    map['email'] = email;
    map['min_amount'] = minAmount;
    map['delay_balance'] = delayBalance;
    map['email_verified_at'] = emailVerifiedAt;
    map['verification_code'] = verificationCode;
    map['new_email_verificiation_code'] = newEmailVerificiationCode;
    map['device_token'] = deviceToken;
    map['avatar'] = avatar;
    map['avatar_original'] = avatarOriginal;
    map['license_img'] = licenseImg;
    map['address'] = address;
    map['country'] = country;
    map['brand_id'] = brandId;
    map['city'] = city;
    map['region'] = region;
    map['postal_code'] = postalCode;
    map['phone'] = phone;
    map['balance'] = balance;
    map['banned'] = banned;
    map['referral_code'] = referralCode;
    map['customer_package_id'] = customerPackageId;
    map['remaining_uploads'] = remainingUploads;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['verification_status'] = verificationStatus;
    map['vip_status'] = vipStatus;
    map['device_type'] = deviceType;
    return map;
  }
}
