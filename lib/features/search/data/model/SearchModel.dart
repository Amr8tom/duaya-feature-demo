/// data : [{"id":6992053,"name":"AGEAL RICH CREAM 50 ML","thumbnail_image":"https://doctorpharmaco.com/public","has_discount":true,"discount":"-20%","stroked_price":"ج.م395.00","main_price":"ج.م316.00","rating":0,"sales":0,"shop_name":"hayah","affiliate_name":"","links":{"details":"https://doctorpharmaco.com/api/v2/products/6992053"}},{"id":6992052,"name":"AGEAL EYE CONTOUR CREAM 15 ML","thumbnail_image":"https://doctorpharmaco.com/public","has_discount":true,"discount":"-20%","stroked_price":"ج.م332.00","main_price":"ج.م265.60","rating":0,"sales":0,"shop_name":"hayah","affiliate_name":"","links":{"details":"https://doctorpharmaco.com/api/v2/products/6992052"}},{"id":3125470,"name":"Anti D Bioscien","thumbnail_image":"https://doctorpharmaco.com/public","has_discount":false,"discount":"-0%","stroked_price":"ج.م65.00","main_price":"ج.م65.00","rating":0,"sales":0,"shop_name":"ASC For Equipments Experts","affiliate_name":"","links":{"details":"https://doctorpharmaco.com/api/v2/products/3125470"}},{"id":3125469,"name":"Anti D Atlas","thumbnail_image":"https://doctorpharmaco.com/public","has_discount":false,"discount":"-0%","stroked_price":"ج.م85.00","main_price":"ج.م85.00","rating":0,"sales":0,"shop_name":"ASC For Equipments Experts","affiliate_name":"","links":{"details":"https://doctorpharmaco.com/api/v2/products/3125469"}},{"id":3125468,"name":"Anti B Atlas","thumbnail_image":"https://doctorpharmaco.com/public","has_discount":false,"discount":"-0%","stroked_price":"ج.م60.00","main_price":"ج.م60.00","rating":0,"sales":0,"shop_name":"ASC For Equipments Experts","affiliate_name":"","links":{"details":"https://doctorpharmaco.com/api/v2/products/3125468"}},{"id":3125467,"name":"Anti B BioScien","thumbnail_image":"https://doctorpharmaco.com/public","has_discount":false,"discount":"-0%","stroked_price":"ج.م40.00","main_price":"ج.م40.00","rating":0,"sales":0,"shop_name":"ASC For Equipments Experts","affiliate_name":"","links":{"details":"https://doctorpharmaco.com/api/v2/products/3125467"}},{"id":3125466,"name":"Anti ABO ","thumbnail_image":"https://doctorpharmaco.com/public","has_discount":false,"discount":"-0%","stroked_price":"ج.م242.00","main_price":"ج.م242.00","rating":0,"sales":0,"shop_name":"ASC For Equipments Experts","affiliate_name":"","links":{"details":"https://doctorpharmaco.com/api/v2/products/3125466"}},{"id":3125465,"name":"Anti A BioScien","thumbnail_image":"https://doctorpharmaco.com/public","has_discount":false,"discount":"-0%","stroked_price":"ج.م30.00","main_price":"ج.م30.00","rating":0,"sales":0,"shop_name":"ASC For Equipments Experts","affiliate_name":"","links":{"details":"https://doctorpharmaco.com/api/v2/products/3125465"}},{"id":3125464,"name":"Anti -A Biomed","thumbnail_image":"https://doctorpharmaco.com/public","has_discount":false,"discount":"-0%","stroked_price":"ج.م40.00","main_price":"ج.م40.00","rating":0,"sales":0,"shop_name":"ASC For Equipments Experts","affiliate_name":"","links":{"details":"https://doctorpharmaco.com/api/v2/products/3125464"}},{"id":3125463,"name":"Anti  A BD Vitro","thumbnail_image":"https://doctorpharmaco.com/public","has_discount":false,"discount":"-0%","stroked_price":"ج.م190.00","main_price":"ج.م190.00","rating":0,"sales":0,"shop_name":"ASC For Equipments Experts","affiliate_name":"","links":{"details":"https://doctorpharmaco.com/api/v2/products/3125463"}}]
/// links : {"first":"https://doctorpharmaco.com/api/v2/products/search?page=1","last":"https://doctorpharmaco.com/api/v2/products/search?page=4","prev":null,"next":"https://doctorpharmaco.com/api/v2/products/search?page=2"}
/// meta : {"current_page":1,"from":1,"last_page":4,"links":[{"url":null,"label":"« Previous","active":false},{"url":"https://doctorpharmaco.com/api/v2/products/search?page=1","label":"1","active":true},{"url":"https://doctorpharmaco.com/api/v2/products/search?page=2","label":"2","active":false},{"url":"https://doctorpharmaco.com/api/v2/products/search?page=3","label":"3","active":false},{"url":"https://doctorpharmaco.com/api/v2/products/search?page=4","label":"4","active":false},{"url":"https://doctorpharmaco.com/api/v2/products/search?page=2","label":"Next »","active":false}],"path":"https://doctorpharmaco.com/api/v2/products/search","per_page":10,"to":10,"total":40}
/// success : true
/// status : 200

class SearchModel {
  SearchModel({
    this.data,
    this.links,
    this.meta,
    this.success,
    this.status,
  });

  SearchModel.fromJson(dynamic json) {
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
/// last_page : 4
/// links : [{"url":null,"label":"« Previous","active":false},{"url":"https://doctorpharmaco.com/api/v2/products/search?page=1","label":"1","active":true},{"url":"https://doctorpharmaco.com/api/v2/products/search?page=2","label":"2","active":false},{"url":"https://doctorpharmaco.com/api/v2/products/search?page=3","label":"3","active":false},{"url":"https://doctorpharmaco.com/api/v2/products/search?page=4","label":"4","active":false},{"url":"https://doctorpharmaco.com/api/v2/products/search?page=2","label":"Next »","active":false}]
/// path : "https://doctorpharmaco.com/api/v2/products/search"
/// per_page : 10
/// to : 10
/// total : 40

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

/// first : "https://doctorpharmaco.com/api/v2/products/search?page=1"
/// last : "https://doctorpharmaco.com/api/v2/products/search?page=4"
/// prev : null
/// next : "https://doctorpharmaco.com/api/v2/products/search?page=2"

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

/// id : 6992053
/// name : "AGEAL RICH CREAM 50 ML"
/// thumbnail_image : "https://doctorpharmaco.com/public"
/// has_discount : true
/// discount : "-20%"
/// stroked_price : "ج.م395.00"
/// main_price : "ج.م316.00"
/// rating : 0
/// sales : 0
/// shop_name : "hayah"
/// affiliate_name : ""
/// links : {"details":"https://doctorpharmaco.com/api/v2/products/6992053"}

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

/// details : "https://doctorpharmaco.com/api/v2/products/6992053"

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
