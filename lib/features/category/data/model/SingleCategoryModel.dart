/// data : [{"id":60143,"name":"Royal Scrub Male - Mixed Fabric","thumbnail_image":"https://doctorpharmaco.com/public","has_discount":false,"discount":"-0%","stroked_price":"ج.م575.00","main_price":"ج.م575.00","rating":0,"sales":16,"shop_name":"Apex for Medical Wear","affiliate_name":"","links":{"details":"https://doctorpharmaco.com/api/v2/products/60143"}},{"id":60142,"name":"Classic Scrub Male - Mixed Fabric","thumbnail_image":"https://doctorpharmaco.com/public","has_discount":false,"discount":"-0%","stroked_price":"ج.م550.00","main_price":"ج.م550.00","rating":0,"sales":10,"shop_name":"Apex for Medical Wear","affiliate_name":"","links":{"details":"https://doctorpharmaco.com/api/v2/products/60142"}},{"id":60141,"name":"Scrub Women SS- Mixed Fabric","thumbnail_image":"https://doctorpharmaco.com/public","has_discount":false,"discount":"-0%","stroked_price":"ج.م550.00","main_price":"ج.م550.00","rating":0,"sales":0,"shop_name":"Apex for Medical Wear","affiliate_name":"","links":{"details":"https://doctorpharmaco.com/api/v2/products/60141"}},{"id":60140,"name":"Classic Long Sleeve Male Scrub - Mixed Fabric","thumbnail_image":"https://doctorpharmaco.com/public","has_discount":false,"discount":"-0%","stroked_price":"ج.م575.00","main_price":"ج.م575.00","rating":0,"sales":0,"shop_name":"Apex for Medical Wear","affiliate_name":"","links":{"details":"https://doctorpharmaco.com/api/v2/products/60140"}},{"id":60139,"name":"Classic Scrub L S Female - Mixed Fabric","thumbnail_image":"https://doctorpharmaco.com/public","has_discount":false,"discount":"-0%","stroked_price":"ج.م575.00","main_price":"ج.م575.00","rating":0,"sales":0,"shop_name":"Apex for Medical Wear","affiliate_name":"","links":{"details":"https://doctorpharmaco.com/api/v2/products/60139"}},{"id":54380,"name":"Esthetic Dental Coat - Male","thumbnail_image":"https://doctorpharmaco.com/public","has_discount":false,"discount":"-0%","stroked_price":"ج.م450.00","main_price":"ج.م450.00","rating":0,"sales":0,"shop_name":"Apex for Medical Wear","affiliate_name":"","links":{"details":"https://doctorpharmaco.com/api/v2/products/54380"}},{"id":54379,"name":"Catchy Long Lab Coat - Female","thumbnail_image":"https://doctorpharmaco.com/public","has_discount":false,"discount":"-0%","stroked_price":"ج.م350.00","main_price":"ج.م350.00","rating":0,"sales":0,"shop_name":"Apex for Medical Wear","affiliate_name":"","links":{"details":"https://doctorpharmaco.com/api/v2/products/54379"}},{"id":54375,"name":"Classic Scrub L S Female-Polyester","thumbnail_image":"https://doctorpharmaco.com/public","has_discount":false,"discount":"-0%","stroked_price":"ج.م400.00","main_price":"ج.م400.00","rating":0,"sales":0,"shop_name":"Apex for Medical Wear","affiliate_name":"","links":{"details":"https://doctorpharmaco.com/api/v2/products/54375"}},{"id":54374,"name":"Royal Elegant Scrub S S Female","thumbnail_image":"https://doctorpharmaco.com/public","has_discount":false,"discount":"-0%","stroked_price":"ج.م400.00","main_price":"ج.م400.00","rating":0,"sales":0,"shop_name":"Apex for Medical Wear","affiliate_name":"","links":{"details":"https://doctorpharmaco.com/api/v2/products/54374"}},{"id":54373,"name":"Premium Female Scrub –","thumbnail_image":"https://doctorpharmaco.com/public","has_discount":false,"discount":"-0%","stroked_price":"ج.م325.00","main_price":"ج.م325.00","rating":0,"sales":0,"shop_name":"Apex for Medical Wear","affiliate_name":"","links":{"details":"https://doctorpharmaco.com/api/v2/products/54373"}}]
/// links : {"first":"https://doctorpharmaco.com/api/v2/products/category/493?page=1","last":"https://doctorpharmaco.com/api/v2/products/category/493?page=3","prev":null,"next":"https://doctorpharmaco.com/api/v2/products/category/493?page=2"}
/// meta : {"current_page":1,"from":1,"last_page":3,"links":[{"url":null,"label":"« Previous","active":false},{"url":"https://doctorpharmaco.com/api/v2/products/category/493?page=1","label":"1","active":true},{"url":"https://doctorpharmaco.com/api/v2/products/category/493?page=2","label":"2","active":false},{"url":"https://doctorpharmaco.com/api/v2/products/category/493?page=3","label":"3","active":false},{"url":"https://doctorpharmaco.com/api/v2/products/category/493?page=2","label":"Next »","active":false}],"path":"https://doctorpharmaco.com/api/v2/products/category/493","per_page":10,"to":10,"total":23}
/// success : true
/// status : 200

class SingleCategoryModel {
  SingleCategoryModel({
    this.data,
    this.links,
    this.meta,
    this.success,
    this.status,
  });

  SingleCategoryModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    success = json['success'];
    status = json['status'];
  }
  List<Data>? data;
  Links? links;
  Meta? meta;
  bool? success;
  num? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      map['links'] = links?.toJson();
    }
    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    map['success'] = success;
    map['status'] = status;
    return map;
  }
}

/// current_page : 1
/// from : 1
/// last_page : 3
/// links : [{"url":null,"label":"« Previous","active":false},{"url":"https://doctorpharmaco.com/api/v2/products/category/493?page=1","label":"1","active":true},{"url":"https://doctorpharmaco.com/api/v2/products/category/493?page=2","label":"2","active":false},{"url":"https://doctorpharmaco.com/api/v2/products/category/493?page=3","label":"3","active":false},{"url":"https://doctorpharmaco.com/api/v2/products/category/493?page=2","label":"Next »","active":false}]
/// path : "https://doctorpharmaco.com/api/v2/products/category/493"
/// per_page : 10
/// to : 10
/// total : 23

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  Meta.fromJson(dynamic json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = [];
      json['links'].forEach((v) {
        links?.add(Links.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }
  num? currentPage;
  num? from;
  num? lastPage;
  List<Links>? links;
  String? path;
  num? perPage;
  num? to;
  num? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = currentPage;
    map['from'] = from;
    map['last_page'] = lastPage;
    if (links != null) {
      map['links'] = links?.map((v) => v.toJson()).toList();
    }
    map['path'] = path;
    map['per_page'] = perPage;
    map['to'] = to;
    map['total'] = total;
    return map;
  }
}

/// url : null
/// label : "« Previous"
/// active : false

class Links {
  Links({
    this.url,
    this.label,
    this.active,
  });

  Links.fromJson(dynamic json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }
  dynamic url;
  String? label;
  bool? active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['label'] = label;
    map['active'] = active;
    return map;
  }
}

/// first : "https://doctorpharmaco.com/api/v2/products/category/493?page=1"
/// last : "https://doctorpharmaco.com/api/v2/products/category/493?page=3"
/// prev : null
/// next : "https://doctorpharmaco.com/api/v2/products/category/493?page=2"

class Links2 {
  Links2({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  Links2.fromJson(dynamic json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }
  String? first;
  String? last;
  dynamic prev;
  String? next;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first'] = first;
    map['last'] = last;
    map['prev'] = prev;
    map['next'] = next;
    return map;
  }
}

/// id : 60143
/// name : "Royal Scrub Male - Mixed Fabric"
/// thumbnail_image : "https://doctorpharmaco.com/public"
/// has_discount : false
/// discount : "-0%"
/// stroked_price : "ج.م575.00"
/// main_price : "ج.م575.00"
/// rating : 0
/// sales : 16
/// shop_name : "Apex for Medical Wear"
/// affiliate_name : ""
/// links : {"details":"https://doctorpharmaco.com/api/v2/products/60143"}

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

/// details : "https://doctorpharmaco.com/api/v2/products/60143"

class Links3 {
  Links3({
    this.details,
  });

  Links3.fromJson(dynamic json) {
    details = json['details'];
  }
  String? details;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['details'] = details;
    return map;
  }
}
