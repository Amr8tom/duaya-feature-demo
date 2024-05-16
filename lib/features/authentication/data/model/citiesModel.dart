/// data : [{"id":74,"name":"الاسكندرية","logo":"https://doctorpharmaco.com/public/uploads/all/lrXSWG07dg9sFwtjl1athWflGFUySpFoUwwnayQo.jpg","links":{"products":"https://doctorpharmaco.com/api/v2/products/brand/74"}},{"id":75,"name":"القاهرة","logo":"https://doctorpharmaco.com/public/uploads/all/07MGG3nFAPACobUzs0yLsCEDjBn77LTmkwhffQun.jpg","links":{"products":"https://doctorpharmaco.com/api/v2/products/brand/75"}},{"id":76,"name":"الجيزة","logo":"https://doctorpharmaco.com/public/uploads/all/UgXMp7sEExjYb2glHwFgzTmIClybJAWZYSrY8m9r.jpg","links":{"products":"https://doctorpharmaco.com/api/v2/products/brand/76"}},{"id":77,"name":"الفيوم","logo":"https://doctorpharmaco.com/public/uploads/all/spIcSmxT0M8EBFOO73JHtK5U8zW6bXGp6XDZdN8F.jpg","links":{"products":"https://doctorpharmaco.com/api/v2/products/brand/77"}},{"id":78,"name":"القليوبية","logo":"https://doctorpharmaco.com/public/uploads/all/g2NLVIlGUDtmUG64P2BknkOQlJbQmTAa6q3RJBwU.jpg","links":{"products":"https://doctorpharmaco.com/api/v2/products/brand/78"}},{"id":79,"name":"الإسماعيلية","logo":"https://doctorpharmaco.com/public/uploads/all/aBDsnGafFx07L1q9t5fhRMcKlmxNbPqvMO70kkJE.jpg","links":{"products":"https://doctorpharmaco.com/api/v2/products/brand/79"}},{"id":80,"name":"أسوان","logo":"https://doctorpharmaco.com/public/uploads/all/45kgFuEKdfyiGFzebJkonZlVXU4oBajXq8ddPJW3.jpg","links":{"products":"https://doctorpharmaco.com/api/v2/products/brand/80"}},{"id":82,"name":"أسيوط","logo":"https://doctorpharmaco.com/public/uploads/all/TztMbxqXiWc1vrjxwHAqABdOvbDDFkPH4uaVmQGd.jpg","links":{"products":"https://doctorpharmaco.com/api/v2/products/brand/82"}},{"id":83,"name":"الأقصر","logo":"https://doctorpharmaco.com/public/uploads/all/txou9PsYNDTRA5IITTPKz81aqdasekuTXvJMYtkf.jpg","links":{"products":"https://doctorpharmaco.com/api/v2/products/brand/83"}},{"id":84,"name":"البحر الأحمر","logo":"https://doctorpharmaco.com/public/uploads/all/RNDMf0j3UxwiGTOFJPEytg2JDWWKHmFZ3Npr4Ckr.jpg","links":{"products":"https://doctorpharmaco.com/api/v2/products/brand/84"}}]
/// links : {"first":"https://doctorpharmaco.com/api/v2/brands?page=1","last":"https://doctorpharmaco.com/api/v2/brands?page=6","prev":null,"next":"https://doctorpharmaco.com/api/v2/brands?page=2"}
/// meta : {"current_page":1,"from":1,"last_page":6,"links":[{"url":null,"label":"« Previous","active":false},{"url":"https://doctorpharmaco.com/api/v2/brands?page=1","label":"1","active":true},{"url":"https://doctorpharmaco.com/api/v2/brands?page=2","label":"2","active":false},{"url":"https://doctorpharmaco.com/api/v2/brands?page=3","label":"3","active":false},{"url":"https://doctorpharmaco.com/api/v2/brands?page=4","label":"4","active":false},{"url":"https://doctorpharmaco.com/api/v2/brands?page=5","label":"5","active":false},{"url":"https://doctorpharmaco.com/api/v2/brands?page=6","label":"6","active":false},{"url":"https://doctorpharmaco.com/api/v2/brands?page=2","label":"Next »","active":false}],"path":"https://doctorpharmaco.com/api/v2/brands","per_page":10,"to":10,"total":59}
/// success : true
/// status : 200

class CitiesModel {
  CitiesModel({
    this.data,
    this.links,
    this.meta,
    this.success,
    this.status,
  });

  CitiesModel.fromJson(dynamic json) {
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
/// last_page : 6
/// links : [{"url":null,"label":"« Previous","active":false},{"url":"https://doctorpharmaco.com/api/v2/brands?page=1","label":"1","active":true},{"url":"https://doctorpharmaco.com/api/v2/brands?page=2","label":"2","active":false},{"url":"https://doctorpharmaco.com/api/v2/brands?page=3","label":"3","active":false},{"url":"https://doctorpharmaco.com/api/v2/brands?page=4","label":"4","active":false},{"url":"https://doctorpharmaco.com/api/v2/brands?page=5","label":"5","active":false},{"url":"https://doctorpharmaco.com/api/v2/brands?page=6","label":"6","active":false},{"url":"https://doctorpharmaco.com/api/v2/brands?page=2","label":"Next »","active":false}]
/// path : "https://doctorpharmaco.com/api/v2/brands"
/// per_page : 10
/// to : 10
/// total : 59

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

/// first : "https://doctorpharmaco.com/api/v2/brands?page=1"
/// last : "https://doctorpharmaco.com/api/v2/brands?page=6"
/// prev : null
/// next : "https://doctorpharmaco.com/api/v2/brands?page=2"

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

/// id : 74
/// name : "الاسكندرية"
/// logo : "https://doctorpharmaco.com/public/uploads/all/lrXSWG07dg9sFwtjl1athWflGFUySpFoUwwnayQo.jpg"
/// links : {"products":"https://doctorpharmaco.com/api/v2/products/brand/74"}

// class Data {
//   Data({
//     this.id,
//     this.name,
//     this.logo,
//     this.links,
//   });
//
//   Data.fromJson(dynamic json) {
//     id = json['id'];
//     name = json['name'];
//     logo = json['logo'];
//     links = json['links'] != null ? Links3.fromJson(json['links']) : null;
//   }
//   num? id;
//   String? name;
//   String? logo;
//   Links3? links;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['name'] = name;
//     map['logo'] = logo;
//     if (links != null) {
//       map['links'] = links?.toJson();
//     }
//     return map;
//   }
// }
class Data {
  Data({
    this.id,
    this.name,
    this.logo,
    this.regions,
    this.links,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    regions = json['regions'] != null ? json['regions'].cast<String>() : [];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }
  num? id;
  String? name;
  String? logo;
  List<String>? regions;
  Links? links;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['logo'] = logo;
    map['regions'] = regions;
    if (links != null) {
      map['links'] = links?.toJson();
    }
    return map;
  }
}

/// products : "https://doctorpharmaco.com/api/v2/products/brand/74"

class Links3 {
  Links3({
    this.products,
  });

  Links3.fromJson(dynamic json) {
    products = json['products'];
  }
  String? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['products'] = products;
    return map;
  }
}
