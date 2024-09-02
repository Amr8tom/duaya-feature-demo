class AllRefundRequestModel {
  AllRefundRequestModel({
    this.data,
    this.links,
    this.meta,
    this.success,
    this.status,
  });

  AllRefundRequestModel.fromJson(dynamic json) {
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
    this.userId,
    this.orderCode,
    this.productName,
    this.productPrice,
    this.refundStatus,
    this.refundLabel,
    this.sellerApproval,
    this.rejectReason,
    this.reason,
    this.date,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    orderCode = json['order_code'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    refundStatus = json['refund_status'];
    refundLabel = json['refund_label'];
    sellerApproval = json['seller_approval'];
    rejectReason = json['reject_reason'];
    reason = json['reason'];
    date = json['date'];
  }
  num? id;
  num? userId;
  String? orderCode;
  String? productName;
  String? productPrice;
  num? refundStatus;
  String? refundLabel;
  num? sellerApproval;
  dynamic rejectReason;
  String? reason;
  String? date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['order_code'] = orderCode;
    map['product_name'] = productName;
    map['product_price'] = productPrice;
    map['refund_status'] = refundStatus;
    map['refund_label'] = refundLabel;
    map['seller_approval'] = sellerApproval;
    map['reject_reason'] = rejectReason;
    map['reason'] = reason;
    map['date'] = date;
    return map;
  }
}
