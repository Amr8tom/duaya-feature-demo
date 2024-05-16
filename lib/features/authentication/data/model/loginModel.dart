class LoginModel {
  LoginModel({
    this.result,
    this.message,
    this.accessToken,
    this.tokenType,
    this.expiresAt,
    this.user,
  });

  LoginModel.fromJson(dynamic json) {
    print("im done");
    result = json['result'];
    message = json['message'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresAt = json['expires_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  bool? result;
  String? message;
  String? accessToken;
  String? tokenType;
  dynamic expiresAt;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = result;
    map['message'] = message;
    map['access_token'] = accessToken;
    map['token_type'] = tokenType;
    map['expires_at'] = expiresAt;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}

class User {
  User({
    this.id,
    this.type,
    this.customerType,
    this.name,
    this.jobName,
    this.brandId,
    this.brandName,
    this.email,
    this.phone,
    this.avatar,
    this.avatarOriginal,
    this.licenseImg,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    customerType = json['customer_type'];
    name = json['name'];
    jobName = json['job_name'];
    brandId = json['brand_id'];
    brandName = json['brand_name'];
    email = json['email'];
    phone = json['phone'];
    avatar = json['avatar'];
    avatarOriginal = json['avatar_original'];
    licenseImg = json['license_img'];
  }
  num? id;
  String? type;
  String? customerType;
  String? name;
  String? jobName;
  String? brandId;
  String? brandName;
  String? email;
  String? phone;
  dynamic avatar;
  String? avatarOriginal;
  dynamic licenseImg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['customer_type'] = customerType;
    map['name'] = name;
    map['job_name'] = jobName;
    map['brand_id'] = brandId;
    map['brand_name'] = brandName;
    map['email'] = email;
    map['phone'] = phone;
    map['avatar'] = avatar;
    map['avatar_original'] = avatarOriginal;
    map['license_img'] = licenseImg;
    return map;
  }
}
