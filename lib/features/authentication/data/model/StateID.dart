class StateIdModel {
  StateIdModel({
    this.data,
    this.success,
    this.status,
  });

  StateIdModel.fromJson(dynamic json) {
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
    this.stateId,
    this.name,
    this.cost,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    stateId = json['state_id'];
    name = json['name'];
    cost = json['cost'];
  }
  int? id;
  int? stateId;
  String? name;
  int? cost;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['state_id'] = stateId;
    map['name'] = name;
    map['cost'] = cost;
    return map;
  }
}
