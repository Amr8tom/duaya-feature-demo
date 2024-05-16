/// combined_order_id : 0
/// result : false
/// redirect_to_seller : true
/// seller_id : 675
/// message : "كمية الطلب أقل من الحد الأدنى لمبلغ الطلب سينا فارما"

class CheckOutModel {
  CheckOutModel({
    this.combinedOrderId,
    this.result,
    this.redirectToSeller,
    this.sellerId,
    this.message,
  });

  CheckOutModel.fromJson(dynamic json) {
    combinedOrderId = json['combined_order_id'];
    result = json['result'];
    redirectToSeller = json['redirect_to_seller'];
    sellerId = json['seller_id'];
    message = json['message'];
  }
  num? combinedOrderId;
  bool? result;
  bool? redirectToSeller;
  num? sellerId;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['combined_order_id'] = combinedOrderId;
    map['result'] = result;
    map['redirect_to_seller'] = redirectToSeller;
    map['seller_id'] = sellerId;
    map['message'] = message;
    return map;
  }
}
