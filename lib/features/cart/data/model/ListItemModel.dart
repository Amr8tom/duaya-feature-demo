/// data : [{"name":"سينا فارما","owner_id":3087,"cart_items":[{"id":23185,"owner_id":3087,"user_id":3059,"product_id":6874342,"product_name":"ستاركوبريكس5مم 30 قرص","product_thumbnail_image":"https://doctorpharmaco.com/public/assets/img/placeholder.jpg","variation":null,"price":135,"currency_symbol":"ج.م","tax":0,"shipping_cost":0,"quantity":2,"lower_limit":1,"upper_limit":50},{"id":29375,"owner_id":3087,"user_id":3059,"product_id":6874794,"product_name":"كيريلا 30مل لوسيون","product_thumbnail_image":"https://doctorpharmaco.com/public/assets/img/placeholder.jpg","variation":null,"price":17.63,"currency_symbol":"ج.م","tax":0,"shipping_cost":0,"quantity":1,"lower_limit":1,"upper_limit":47}]},{"name":"عناية","owner_id":3274,"cart_items":[{"id":28767,"owner_id":3274,"user_id":3059,"product_id":6945595,"product_name":"كتافلام 6امبول س ج/نوفارتس","product_thumbnail_image":"https://doctorpharmaco.com/public/assets/img/placeholder.jpg","variation":null,"price":63.08,"currency_symbol":"ج.م","tax":0,"shipping_cost":0,"quantity":1,"lower_limit":1,"upper_limit":9}]}]

class ListItemModel {
  ListItemModel({
    this.data,
  });

  ListItemModel.fromJson(dynamic json) {
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

/// name : "سينا فارما"
/// owner_id : 3087
/// cart_items : [{"id":23185,"owner_id":3087,"user_id":3059,"product_id":6874342,"product_name":"ستاركوبريكس5مم 30 قرص","product_thumbnail_image":"https://doctorpharmaco.com/public/assets/img/placeholder.jpg","variation":null,"price":135,"currency_symbol":"ج.م","tax":0,"shipping_cost":0,"quantity":2,"lower_limit":1,"upper_limit":50},{"id":29375,"owner_id":3087,"user_id":3059,"product_id":6874794,"product_name":"كيريلا 30مل لوسيون","product_thumbnail_image":"https://doctorpharmaco.com/public/assets/img/placeholder.jpg","variation":null,"price":17.63,"currency_symbol":"ج.م","tax":0,"shipping_cost":0,"quantity":1,"lower_limit":1,"upper_limit":47}]

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

/// id : 23185
/// owner_id : 3087
/// user_id : 3059
/// product_id : 6874342
/// product_name : "ستاركوبريكس5مم 30 قرص"
/// product_thumbnail_image : "https://doctorpharmaco.com/public/assets/img/placeholder.jpg"
/// variation : null
/// price : 135
/// currency_symbol : "ج.م"
/// tax : 0
/// shipping_cost : 0
/// quantity : 2
/// lower_limit : 1
/// upper_limit : 50

class CartItems {
  CartItems({
    this.id,
    this.ownerId,
    this.userId,
    this.productId,
    this.productName,
    this.productThumbnailImage,
    this.variation,
    this.price,
    this.currencySymbol,
    this.tax,
    this.shippingCost,
    this.quantity,
    this.lowerLimit,
    this.upperLimit,
  });

  CartItems.fromJson(dynamic json) {
    id = json['id'];
    ownerId = json['owner_id'];
    userId = json['user_id'];
    productId = json['product_id'];
    productName = json['product_name'];
    productThumbnailImage = json['product_thumbnail_image'];
    variation = json['variation'];
    price = json['price'];
    currencySymbol = json['currency_symbol'];
    tax = json['tax'];
    shippingCost = json['shipping_cost'];
    quantity = json['quantity'];
    lowerLimit = json['lower_limit'];
    upperLimit = json['upper_limit'];
  }
  num? id;
  num? ownerId;
  num? userId;
  num? productId;
  String? productName;
  String? productThumbnailImage;
  dynamic variation;
  num? price;
  String? currencySymbol;
  num? tax;
  num? shippingCost;
  int? quantity;
  num? lowerLimit;
  num? upperLimit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['owner_id'] = ownerId;
    map['user_id'] = userId;
    map['product_id'] = productId;
    map['product_name'] = productName;
    map['product_thumbnail_image'] = productThumbnailImage;
    map['variation'] = variation;
    map['price'] = price;
    map['currency_symbol'] = currencySymbol;
    map['tax'] = tax;
    map['shipping_cost'] = shippingCost;
    map['quantity'] = quantity;
    map['lower_limit'] = lowerLimit;
    map['upper_limit'] = upperLimit;
    return map;
  }
}
