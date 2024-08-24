class CheckItemModel {
  CheckItemModel({
    this.message,
    this.isInWishlist,
    this.productId,
    this.wishlistId,
  });

  CheckItemModel.fromJson(dynamic json) {
    message = json['message'];
    isInWishlist = json['is_in_wishlist'];
    productId = json['product_id'];
    wishlistId = json['wishlist_id'];
  }
  String? message;
  bool? isInWishlist;
  num? productId;
  num? wishlistId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['is_in_wishlist'] = isInWishlist;
    map['product_id'] = productId;
    map['wishlist_id'] = wishlistId;
    return map;
  }
}
