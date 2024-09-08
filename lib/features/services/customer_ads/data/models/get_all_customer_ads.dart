class GetAllCustomerAds {
  GetAllCustomerAds({
    this.status,
  });

  GetAllCustomerAds.fromJson(dynamic json) {
    status = json['status'];
  }
  bool? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    return map;
  }
}
