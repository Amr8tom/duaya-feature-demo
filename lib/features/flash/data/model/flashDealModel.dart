class FlashDealModel {
  FlashDealModel({
    this.data,
    this.success,
    this.status,
  });

  FlashDealModel.fromJson(dynamic json) {
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

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   if (data != null) {
  //     map['data'] = data?.map((v) => v.toJson()).toList();
  //   }
  //   map['success'] = success;
  //   map['status'] = status;
  //   return map;
  // }
}

class Data {
  Data({
    this.id,
    this.title,
    this.date,
    this.banner,
    this.products,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    date = json['date'];
    banner = json['banner'];
    products =
        json['products'] != null ? Products.fromJson(json['products']) : null;
  }
  num? id;
  String? title;
  num? date;
  String? banner;
  Products? products;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['id'] = id;
  //   map['title'] = title;
  //   map['date'] = date;
  //   map['banner'] = banner;
  //   if (products != null) {
  //     map['products'] = products?.toJson();
  //   }
  //   return map;
  // }
}

class Products {
  Products({
    this.data2,
  });

  Products.fromJson(dynamic json) {
    if (json['data'] != null) {
      data2 = [];
      json['data'].forEach((v) {
        data2?.add(Data2.fromJson(v));
      });
    }
  }
  List<Data2>? data2;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data2 != null) {
      map['data'] = data2?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data2 {
  Data2({
    this.id,
    this.name,
    this.image,
    this.price,
    this.links,
  });

  Data2.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }
  num? id;
  String? name;
  String? image;
  String? price;
  Links? links;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
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
