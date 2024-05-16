/// result : true
/// message : "تمت إضافة المنتج إلى عربة التسوق بنجاح"

class addToCartModel {
  addToCartModel({
    this.result,
    this.message,
  });

  addToCartModel.fromJson(dynamic json) {
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
