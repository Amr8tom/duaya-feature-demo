class ConvertClubpointModel {
  ConvertClubpointModel({
      this.success, 
      this.message,});

  ConvertClubpointModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
  }
  bool? success;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    return map;
  }

}