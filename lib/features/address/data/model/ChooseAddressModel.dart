class ChooseAddressModel {
  ChooseAddressModel({
    this.result,
    this.message,
  });

  ChooseAddressModel.fromJson(dynamic json) {
    result = json['result'];
    message = json['message'];
  }
  bool? result;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = result;
    map['message'] = message;
    return map;
  }
}
