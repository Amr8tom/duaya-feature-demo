class AdressListModel {
  AdressListModel({
    this.data,
    this.success,
    this.status,
  });

  AdressListModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    success = json['success'];
    status = json['status'];
  }
  List<Data>? data;
  bool? success;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['success'] = success;
    map['status'] = status;
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.userId,
    this.address,
    this.countryId,
    this.stateId,
    this.cityId,
    this.countryName,
    this.stateName,
    this.cityName,
    this.postalCode,
    this.phone,
    this.setDefault,
    this.locationAvailable,
    this.lat,
    this.lang,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    address = json['address'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    countryName = json['country_name'];
    stateName = json['state_name'];
    cityName = json['city_name'];
    postalCode = json['postal_code'];
    phone = json['phone'];
    setDefault = json['set_default'];
    locationAvailable = json['location_available'];
    lat = json['lat'];
    lang = json['lang'];
  }
  int? id;
  int? userId;
  String? address;
  int? countryId;
  int? stateId;
  int? cityId;
  String? countryName;
  String? stateName;
  String? cityName;
  String? postalCode;
  String? phone;
  int? setDefault;
  bool? locationAvailable;
  double? lat;
  double? lang;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['address'] = address;
    map['country_id'] = countryId;
    map['state_id'] = stateId;
    map['city_id'] = cityId;
    map['country_name'] = countryName;
    map['state_name'] = stateName;
    map['city_name'] = cityName;
    map['postal_code'] = postalCode;
    map['phone'] = phone;
    map['set_default'] = setDefault;
    map['location_available'] = locationAvailable;
    map['lat'] = lat;
    map['lang'] = lang;
    return map;
  }
}
