/// data : [{"id":732,"name":"عناية","logo":"https://doctorpharmaco.com/public/assets/img/placeholder.jpg","rating":0},{"id":721,"name":"الأصدقاء","logo":"https://doctorpharmaco.com/public/assets/img/placeholder.jpg","rating":0},{"id":708,"name":"الزهراء فارما","logo":"https://doctorpharmaco.com/public/assets/img/placeholder.jpg","rating":0},{"id":707,"name":"الفؤاد أوفر سيز للتوزيع","logo":"https://doctorpharmaco.com/public/assets/img/placeholder.jpg","rating":0},{"id":692,"name":"مخزن الملكة -القاهرة","logo":"https://doctorpharmaco.com/public/assets/img/placeholder.jpg","rating":0},{"id":679,"name":"المستقبل","logo":"https://doctorpharmaco.com/public/assets/img/placeholder.jpg","rating":0},{"id":678,"name":"الخليج فارما","logo":"https://doctorpharmaco.com/public/assets/img/placeholder.jpg","rating":0},{"id":675,"name":"سينا فارما","logo":"https://doctorpharmaco.com/public/assets/img/placeholder.jpg","rating":0},{"id":673,"name":"ميدكو","logo":"https://doctorpharmaco.com/public/assets/img/placeholder.jpg","rating":0},{"id":663,"name":"المروه","logo":"https://doctorpharmaco.com/public/assets/img/placeholder.jpg","rating":0}]
/// links : {"first":"https://doctorpharmaco.com/api/v2/shops?page=1","last":"https://doctorpharmaco.com/api/v2/shops?page=8","prev":null,"next":"https://doctorpharmaco.com/api/v2/shops?page=2"}
/// meta : {"current_page":1,"from":1,"last_page":8,"links":[{"url":null,"label":"« Previous","active":false},{"url":"https://doctorpharmaco.com/api/v2/shops?page=1","label":"1","active":true},{"url":"https://doctorpharmaco.com/api/v2/shops?page=2","label":"2","active":false},{"url":"https://doctorpharmaco.com/api/v2/shops?page=3","label":"3","active":false},{"url":"https://doctorpharmaco.com/api/v2/shops?page=4","label":"4","active":false},{"url":"https://doctorpharmaco.com/api/v2/shops?page=5","label":"5","active":false},{"url":"https://doctorpharmaco.com/api/v2/shops?page=6","label":"6","active":false},{"url":"https://doctorpharmaco.com/api/v2/shops?page=7","label":"7","active":false},{"url":"https://doctorpharmaco.com/api/v2/shops?page=8","label":"8","active":false},{"url":"https://doctorpharmaco.com/api/v2/shops?page=2","label":"Next »","active":false}],"path":"https://doctorpharmaco.com/api/v2/shops","per_page":10,"to":10,"total":79}
/// success : true
/// status : 200

class CompaniesByPageModel {
  CompaniesByPageModel({
    this.data,
    this.links,
    this.meta,
    this.success,
    this.status,
  });

  CompaniesByPageModel.fromJson(dynamic json) {
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
/// last_page : 8
/// links : [{"url":null,"label":"« Previous","active":false},{"url":"https://doctorpharmaco.com/api/v2/shops?page=1","label":"1","active":true},{"url":"https://doctorpharmaco.com/api/v2/shops?page=2","label":"2","active":false},{"url":"https://doctorpharmaco.com/api/v2/shops?page=3","label":"3","active":false},{"url":"https://doctorpharmaco.com/api/v2/shops?page=4","label":"4","active":false},{"url":"https://doctorpharmaco.com/api/v2/shops?page=5","label":"5","active":false},{"url":"https://doctorpharmaco.com/api/v2/shops?page=6","label":"6","active":false},{"url":"https://doctorpharmaco.com/api/v2/shops?page=7","label":"7","active":false},{"url":"https://doctorpharmaco.com/api/v2/shops?page=8","label":"8","active":false},{"url":"https://doctorpharmaco.com/api/v2/shops?page=2","label":"Next »","active":false}]
/// path : "https://doctorpharmaco.com/api/v2/shops"
/// per_page : 10
/// to : 10
/// total : 79

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

class metaLinks {
  metaLinks({
    this.url,
    this.label,
    this.active,
  });

  metaLinks.fromJson(dynamic json) {
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

/// first : "https://doctorpharmaco.com/api/v2/shops?page=1"
/// last : "https://doctorpharmaco.com/api/v2/shops?page=8"

/// prev : null
/// next : "https://doctorpharmaco.com/api/v2/shops?page=2"

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  Links.fromJson(dynamic json) {
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

/// id : 732
/// name : "عناية"
/// logo : "https://doctorpharmaco.com/public/assets/img/placeholder.jpg"
/// rating : 0

class Data {
  Data({
    this.id,
    this.name,
    this.logo,
    this.round,
    this.rating,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    round = json['round'];
    rating = json['rating'];
  }
  num? id;
  String? name;
  String? logo;
  String? round;
  num? rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['logo'] = logo;
    map['round'] = round;
    map['rating'] = rating;
    return map;
  }
}
