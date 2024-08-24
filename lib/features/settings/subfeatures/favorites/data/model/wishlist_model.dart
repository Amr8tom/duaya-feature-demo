class WishlistModel {
  WishlistModel({
    this.data,
    this.success,
    this.status,
  });

  WishlistModel.fromJson(dynamic json) {
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
    this.product,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }
  num? id;
  Product? product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (product != null) {
      map['product'] = product?.toJson();
    }
    return map;
  }
}

class Product {
  Product({
    this.id,
    this.name,
    this.thumbnailImage,
    this.basePrice,
    this.rating,
  });

  Product.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    thumbnailImage = json['thumbnail_image'];
    basePrice = json['base_price'];
    rating = json['rating'];
  }
  num? id;
  String? name;
  String? thumbnailImage;
  String? basePrice;
  num? rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['thumbnail_image'] = thumbnailImage;
    map['base_price'] = basePrice;
    map['rating'] = rating;
    return map;
  }
}
