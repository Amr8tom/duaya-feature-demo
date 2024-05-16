/// count : 10
/// status : true

class CartCount {
  CartCount({
    this.count,
    this.status,
  });

  CartCount.fromJson(dynamic json) {
    count = json['count'];
    status = json['status'];
  }
  num? count;
  bool? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['status'] = status;
    return map;
  }
}
