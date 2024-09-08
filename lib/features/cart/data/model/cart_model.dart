class CartModel {
  CartModel({
    this.data,
  });

  CartModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    this.name,
    this.ownerId,
    this.cartItems,
  });

  Data.fromJson(dynamic json) {
    name = json['name'];
    ownerId = json['owner_id'];
    if (json['cart_items'] != null) {
      cartItems = [];
      json['cart_items'].forEach((v) {
        cartItems?.add(CartItems.fromJson(v));
      });
    }
  }
  String? name;
  num? ownerId;
  List<CartItems>? cartItems;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['owner_id'] = ownerId;
    if (cartItems != null) {
      map['cart_items'] = cartItems?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class CartItems {
  CartItems({
    this.id,
    this.ownerId,
    this.userId,
    this.productId,
    this.round,
    this.productName,
    this.shopName,
    this.productThumbnailImage,
    this.variation,
    this.price,
    this.currencySymbol,
    this.tax,
    this.shippingCost,
    this.quantity,
    this.lowerLimit,
    this.maxLimit,
    this.upperLimit,
  });

  CartItems.fromJson(dynamic json) {
    id = json['id'];
    ownerId = json['owner_id'];
    userId = json['user_id'];
    productId = json['product_id'];
    productName = json['product_name'];
    shopName = json['shop_name'];
    round = json['round'];
    productThumbnailImage = json['product_thumbnail_image'];
    variation = json['variation'];
    price = json['price'];
    currencySymbol = json['currency_symbol'];
    tax = json['tax'];
    shippingCost = json['shipping_cost'];
    quantity = json['quantity'];
    lowerLimit = json['lower_limit'];
    maxLimit = json['max_limit'];
    upperLimit = json['upper_limit'];
  }
  num? id;
  num? ownerId;
  num? userId;
  num? productId;
  String? productName;
  String? shopName;
  String? round;
  String? productThumbnailImage;
  dynamic variation;
  num? price;
  String? currencySymbol;
  num? tax;
  num? shippingCost;
  int? quantity;
  num? lowerLimit;
  num? maxLimit;
  num? upperLimit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['owner_id'] = ownerId;
    map['user_id'] = userId;
    map['product_id'] = productId;
    map['product_name'] = productName;
    map['shop_name'] = shopName;
    map['product_thumbnail_image'] = productThumbnailImage;
    map['variation'] = variation;
    map['price'] = price;
    map['currency_symbol'] = currencySymbol;
    map['tax'] = tax;
    map['shipping_cost'] = shippingCost;
    map['quantity'] = quantity;
    map['lower_limit'] = lowerLimit;
    map['max_limit'] = maxLimit;
    map['upper_limit'] = upperLimit;
    return map;
  }
}
