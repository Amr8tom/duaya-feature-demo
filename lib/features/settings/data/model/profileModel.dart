class ProfileModel {
  ProfileModel({
    this.cartItemCount,
    this.wishlistItemCount,
    this.orderCount,
    this.isDelay,
    this.delayBalance,
    this.minAmount,
    this.vipStatus,
    this.verificationStatus,
    this.available,
    this.message,
  });

  ProfileModel.fromJson(dynamic json) {
    cartItemCount = json['cart_item_count'];
    wishlistItemCount = json['wishlist_item_count'];
    orderCount = json['order_count'];
    isDelay = json['is_delay'];
    delayBalance = json['delay_balance'];
    minAmount = json['min_amount'];
    vipStatus = json['vip_status'];
    verificationStatus = json['verification_status'];
    available = json['available'];
    message = json['message'];
  }
  int? cartItemCount;
  int? wishlistItemCount;
  int? orderCount;
  int? isDelay;
  num? delayBalance;
  int? minAmount;
  int? vipStatus;
  int? verificationStatus;
  bool? available;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cart_item_count'] = cartItemCount;
    map['wishlist_item_count'] = wishlistItemCount;
    map['order_count'] = orderCount;
    map['is_delay'] = isDelay;
    map['delay_balance'] = delayBalance;
    map['min_amount'] = minAmount;
    map['vip_status'] = vipStatus;
    map['verification_status'] = verificationStatus;
    map['available'] = available;
    map['message'] = message;
    return map;
  }
}
