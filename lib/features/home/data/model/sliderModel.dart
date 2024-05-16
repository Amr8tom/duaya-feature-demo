class SliderModel {
  SliderModel({
    this.data,
    this.success,
    this.status,
  });

  SliderModel.fromJson(dynamic json) {
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
  num? status;

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
    this.photo,
  });

  Data.fromJson(dynamic json) {
    photo = json['photo'];
  }
  String? photo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['photo'] = photo;
    return map;
  }
}
