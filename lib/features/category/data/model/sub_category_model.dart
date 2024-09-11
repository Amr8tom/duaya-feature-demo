class SubCategoryModel {
  SubCategoryModel({
    this.data,
    this.success,
    this.status,
  });

  SubCategoryModel.fromJson(dynamic json) {
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
    this.banner,
    this.icon,
    this.numberOfChildren,
    this.links,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    banner = json['banner'];
    icon = json['icon'];
    numberOfChildren = json['number_of_children'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }
  num? id;
  String? name;
  String? banner;
  String? icon;
  num? numberOfChildren;
  Links? links;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['banner'] = banner;
    map['icon'] = icon;
    map['number_of_children'] = numberOfChildren;
    if (links != null) {
      map['links'] = links?.toJson();
    }
    return map;
  }
}

class Links {
  Links({
    this.products,
    this.subCategories,
  });

  Links.fromJson(dynamic json) {
    products = json['products'];
    subCategories = json['sub_categories'];
  }
  String? products;
  String? subCategories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['products'] = products;
    map['sub_categories'] = subCategories;
    return map;
  }
}
