class AdDetailsModel {
  AdDetailsModel({
    this.status,
  });

  AdDetailsModel.fromJson(dynamic json) {
    status = json['status'];
  }
  bool? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    return map;
  }
}
