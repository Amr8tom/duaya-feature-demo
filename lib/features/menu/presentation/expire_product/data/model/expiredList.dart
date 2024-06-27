class ExpiredListModel {
  ExpiredListModel({
    this.data,
    this.links,
    this.meta,
    this.success,
    this.status,
  });

  ExpiredListModel.fromJson(dynamic json) {
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
  int? status;

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
  int? currentPage;
  int? from;
  int? lastPage;
  List<Links>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

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
  dynamic next;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first'] = first;
    map['last'] = last;
    map['prev'] = prev;
    map['next'] = next;
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.name,
    this.thumbnailImage,
    this.photos,
    this.unitPrice,
    this.category,
    this.expiredDate,
    this.approved,
    this.currentStock,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    thumbnailImage = json['thumbnail_image'];
    photos = json['photos'];
    unitPrice = json['unit_price'];
    category = json['category'];
    expiredDate = json['expired_date'];
    approved = json['approved'];
    currentStock = json['current_stock'];
  }
  int? id;
  String? name;
  String? thumbnailImage;
  String? photos;
  String? unitPrice;
  String? category;
  String? expiredDate;
  bool? approved;
  int? currentStock;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['thumbnail_image'] = thumbnailImage;
    map['photos'] = photos;
    map['unit_price'] = unitPrice;
    map['category'] = category;
    map['expired_date'] = expiredDate;
    map['approved'] = approved;
    map['current_stock'] = currentStock;
    return map;
  }
}
