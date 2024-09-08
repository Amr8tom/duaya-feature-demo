class AddAdModel {
  AddAdModel({
    this.status,
  });

  AddAdModel.fromJson(dynamic json) {
    status = json['status'];
  }
  bool? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    return map;
  }
}
