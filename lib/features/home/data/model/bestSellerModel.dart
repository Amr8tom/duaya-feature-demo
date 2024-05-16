class BestSellerModel {
  BestSellerModel({
    this.data,
    this.success,
    this.status,
  });

  BestSellerModel.fromJson(dynamic json) {
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
    this.name,
    this.thumbnailImage,
    this.hasDiscount,
    this.discount,
    this.strokedPrice,
    this.mainPrice,
    this.rating,
    this.sales,
    this.shopName,
    this.affiliateName,
    this.links,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    thumbnailImage = json['thumbnail_image'];
    hasDiscount = json['has_discount'];
    discount = json['discount'];
    strokedPrice = json['stroked_price'];
    mainPrice = json['main_price'];
    rating = json['rating'];
    sales = json['sales'];
    shopName = json['shop_name'];
    affiliateName = json['affiliate_name'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }
  num? id;
  String? name;
  String? thumbnailImage;
  bool? hasDiscount;
  String? discount;
  String? strokedPrice;
  String? mainPrice;
  num? rating;
  num? sales;
  String? shopName;
  String? affiliateName;
  Links? links;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['thumbnail_image'] = thumbnailImage;
    map['has_discount'] = hasDiscount;
    map['discount'] = discount;
    map['stroked_price'] = strokedPrice;
    map['main_price'] = mainPrice;
    map['rating'] = rating;
    map['sales'] = sales;
    map['shop_name'] = shopName;
    map['affiliate_name'] = affiliateName;
    if (links != null) {
      map['links'] = links?.toJson();
    }
    return map;
  }
}

class Links {
  Links({
    this.details,
  });

  Links.fromJson(dynamic json) {
    details = json['details'];
  }
  String? details;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['details'] = details;
    return map;
  }
}
