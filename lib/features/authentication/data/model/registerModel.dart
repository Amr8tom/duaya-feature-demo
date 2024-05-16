/// result : false
/// message : "Validation error"
/// errors : {"brand_id":["The selected brand id is invalid."]}

class RegisterModel {
  RegisterModel({
    this.result,
    this.message,
    this.errors,
  });

  RegisterModel.fromJson(dynamic json) {
    result = json['result'];
    message = json['message'];
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }
  bool? result;
  String? message;
  Errors? errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = result;
    map['message'] = message;
    if (errors != null) {
      map['errors'] = errors?.toJson();
    }
    return map;
  }
}

/// brand_id : ["The selected brand id is invalid."]

class Errors {
  Errors({
    this.brandId,
  });

  Errors.fromJson(dynamic json) {
    brandId = json['brand_id'] != null ? json['brand_id'].cast<String>() : [];
  }
  List<String>? brandId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['brand_id'] = brandId;
    return map;
  }
}
