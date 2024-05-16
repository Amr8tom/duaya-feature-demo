/// result : true
/// results : [{"id":29654,"result":true,"message":"تم تحديث عربة التسوق"},{"id":29655,"result":true,"message":"تم تحديث عربة التسوق"}]

class ChangeQuantitiyModel {
  ChangeQuantitiyModel({
    this.result,
    this.results,
  });

  ChangeQuantitiyModel.fromJson(dynamic json) {
    result = json['result'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }
  bool? result;
  List<Results>? results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = result;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 29654
/// result : true
/// message : "تم تحديث عربة التسوق"

class Results {
  Results({
    this.id,
    this.result,
    this.message,
  });

  Results.fromJson(dynamic json) {
    id = json['id'];
    result = json['result'];
    message = json['message'];
  }
  String? id;
  bool? result;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['result'] = result;
    map['message'] = message;
    return map;
  }
}
