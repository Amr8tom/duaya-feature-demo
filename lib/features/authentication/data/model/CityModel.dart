class CityModel {
  CityModel({
    this.data,
    this.success,
    this.status,
  });

  CityModel.fromJson(dynamic json) {
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
    this.countryId,
    this.name,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    countryId = json['country_id'];
    name = json['name'];
  }
  int? id;
  int? countryId;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['country_id'] = countryId;
    map['name'] = name;
    return map;
  }
}
