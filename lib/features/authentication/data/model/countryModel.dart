class CountryModel {
  CountryModel({
    this.data,
    this.success,
    this.status,
  });

  CountryModel.fromJson(dynamic json) {
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
    this.code,
    this.name,
    this.status,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    status = json['status'];
  }
  int? id;
  String? code;
  String? name;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['code'] = code;
    map['name'] = name;
    map['status'] = status;
    return map;
  }
}
