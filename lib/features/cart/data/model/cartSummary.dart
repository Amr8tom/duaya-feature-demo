/// sub_total : "ج.م6,147.48"
/// tax : "ج.م0.00"
/// shipping_cost : "ج.م0.00"
/// discount : "ج.م0.00"
/// grand_total : "ج.م6,147.48"
/// grand_total_value : 6147.4800000000005
/// coupon_code : null
/// coupon_applied : false

class CartSummary {
  CartSummary({
    this.subTotal,
    this.tax,
    this.shippingCost,
    this.discount,
    this.grandTotal,
    this.grandTotalValue,
    this.couponCode,
    this.couponApplied,
  });

  CartSummary.fromJson(dynamic json) {
    subTotal = json['sub_total'];
    tax = json['tax'];
    shippingCost = json['shipping_cost'];
    discount = json['discount'];
    grandTotal = json['grand_total'];
    grandTotalValue = json['grand_total_value'];
    couponCode = json['coupon_code'];
    couponApplied = json['coupon_applied'];
  }
  String? subTotal;
  String? tax;
  String? shippingCost;
  String? discount;
  String? grandTotal;
  num? grandTotalValue;
  dynamic couponCode;
  bool? couponApplied;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sub_total'] = subTotal;
    map['tax'] = tax;
    map['shipping_cost'] = shippingCost;
    map['discount'] = discount;
    map['grand_total'] = grandTotal;
    map['grand_total_value'] = grandTotalValue;
    map['coupon_code'] = couponCode;
    map['coupon_applied'] = couponApplied;
    return map;
  }
}
