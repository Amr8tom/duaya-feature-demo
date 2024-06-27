class ShortCommingBook {
  ShortCommingBook({
    this.success,
    this.message,
    this.id,
  });

  ShortCommingBook.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    id = json['id'];
  }
  bool? success;
  String? message;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['id'] = id;
    return map;
  }
}
