/// result : true
/// message : "Product is successfully removed from your cart"

class DeleteModel {
  DeleteModel({
    this.result,
    this.message,
  });

  DeleteModel.fromJson(dynamic json) {
    result = json['result'];
    message = json['message'];
  }
  bool? result;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = result;
    map['message'] = message;
    return map;
  }
}
