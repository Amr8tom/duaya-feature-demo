class OrderItemsModel {
  OrderItemsModel({
    this.data,
    this.success,
    this.status,
  });

  OrderItemsModel.fromJson(dynamic json) {
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
    this.id,
    this.productId,
    this.productName,
    this.variation,
    this.price,
    this.tax,
    this.shippingCost,
    this.couponDiscount,
    this.quantity,
    this.paymentStatus,
    this.paymentStatusString,
    this.deliveryStatus,
    this.deliveryStatusString,
    this.refundSection,
    this.refundButton,
    this.refundLabel,
    this.refundRequestStatus,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    productName = json['product_name'];
    variation = json['variation'];
    price = json['price'];
    tax = json['tax'];
    shippingCost = json['shipping_cost'];
    couponDiscount = json['coupon_discount'];
    quantity = json['quantity'];
    paymentStatus = json['payment_status'];
    paymentStatusString = json['payment_status_string'];
    deliveryStatus = json['delivery_status'];
    deliveryStatusString = json['delivery_status_string'];
    refundSection = json['refund_section'];
    refundButton = json['refund_button'];
    refundLabel = json['refund_label'];
    refundRequestStatus = json['refund_request_status'];
  }
  num? id;
  num? productId;
  String? productName;
  dynamic variation;
  String? price;
  String? tax;
  String? shippingCost;
  String? couponDiscount;
  num? quantity;
  String? paymentStatus;
  String? paymentStatusString;
  String? deliveryStatus;
  String? deliveryStatusString;
  bool? refundSection;
  bool? refundButton;
  String? refundLabel;
  num? refundRequestStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product_id'] = productId;
    map['product_name'] = productName;
    map['variation'] = variation;
    map['price'] = price;
    map['tax'] = tax;
    map['shipping_cost'] = shippingCost;
    map['coupon_discount'] = couponDiscount;
    map['quantity'] = quantity;
    map['payment_status'] = paymentStatus;
    map['payment_status_string'] = paymentStatusString;
    map['delivery_status'] = deliveryStatus;
    map['delivery_status_string'] = deliveryStatusString;
    map['refund_section'] = refundSection;
    map['refund_button'] = refundButton;
    map['refund_label'] = refundLabel;
    map['refund_request_status'] = refundRequestStatus;
    return map;
  }
}
