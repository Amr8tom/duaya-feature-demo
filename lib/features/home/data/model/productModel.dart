class ProductModel {
  ProductModel({
    this.data,
    this.success,
    this.status,
  });

  ProductModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    success = json['success'];
    status = json['status'];
  }
  List<Data>? data;
  bool? success;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['success'] = success;
    map['status'] = status;
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.name,
    this.addedBy,
    this.sellerId,
    this.shopId,
    this.shopName,
    this.shopLogo,
    this.photos,
    this.thumbnailImage,
    this.tags,
    this.priceHighLow,
    this.choiceOptions,
    this.colors,
    this.hasDiscount,
    this.discount,
    this.strokedPrice,
    this.mainPrice,
    this.calculablePrice,
    this.currencySymbol,
    this.currentStock,
    this.unit,
    this.rating,
    this.ratingCount,
    this.earnPoint,
    this.description,
    this.videoLink,
    this.brand,
    this.link,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    addedBy = json['added_by'];
    sellerId = json['seller_id'];
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    shopLogo = json['shop_logo'];
    if (json['photos'] != null) {
      photos = [];
      json['photos'].forEach((v) {
        photos?.add(Photos.fromJson(v));
      });
    }
    thumbnailImage = json['thumbnail_image'];
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    priceHighLow = json['price_high_low'];
    if (json['choice_options'] != null) {
      choiceOptions = [];
      json['choice_options'].forEach((v) {
        choiceOptions?.add(ChoiceOptions.fromJson(v));
      });
    }
    colors = json['colors'] != null ? json['colors'].cast<String>() : [];
    hasDiscount = json['has_discount'];
    discount = json['discount'];
    strokedPrice = json['stroked_price'];
    mainPrice = json['main_price'];
    calculablePrice = json['calculable_price'];
    currencySymbol = json['currency_symbol'];
    currentStock = json['current_stock'];
    unit = json['unit'];
    rating = json['rating'];
    ratingCount = json['rating_count'];
    earnPoint = json['earn_point'];
    description = json['description'];
    videoLink = json['video_link'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    link = json['link'];
  }
  int? id;
  String? name;
  String? addedBy;
  int? sellerId;
  int? shopId;
  String? shopName;
  String? shopLogo;
  List<Photos>? photos;
  String? thumbnailImage;
  List<String>? tags;
  String? priceHighLow;
  List<ChoiceOptions>? choiceOptions;
  List<String>? colors;
  bool? hasDiscount;
  String? discount;
  String? strokedPrice;
  String? mainPrice;
  int? calculablePrice;
  String? currencySymbol;
  int? currentStock;
  String? unit;
  int? rating;
  int? ratingCount;
  int? earnPoint;
  String? description;
  String? videoLink;
  Brand? brand;
  String? link;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['added_by'] = addedBy;
    map['seller_id'] = sellerId;
    map['shop_id'] = shopId;
    map['shop_name'] = shopName;
    map['shop_logo'] = shopLogo;
    if (photos != null) {
      map['photos'] = photos?.map((v) => v.toJson()).toList();
    }
    map['thumbnail_image'] = thumbnailImage;
    map['tags'] = tags;
    map['price_high_low'] = priceHighLow;
    if (choiceOptions != null) {
      map['choice_options'] = choiceOptions?.map((v) => v.toJson()).toList();
    }
    map['colors'] = colors;
    map['has_discount'] = hasDiscount;
    map['discount'] = discount;
    map['stroked_price'] = strokedPrice;
    map['main_price'] = mainPrice;
    map['calculable_price'] = calculablePrice;
    map['currency_symbol'] = currencySymbol;
    map['current_stock'] = currentStock;
    map['unit'] = unit;
    map['rating'] = rating;
    map['rating_count'] = ratingCount;
    map['earn_point'] = earnPoint;
    map['description'] = description;
    map['video_link'] = videoLink;
    if (brand != null) {
      map['brand'] = brand?.toJson();
    }
    map['link'] = link;
    return map;
  }
}

class Brand {
  Brand({
    this.id,
    this.name,
    this.logo,
  });

  Brand.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
  }
  int? id;
  String? name;
  String? logo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['logo'] = logo;
    return map;
  }
}

class ChoiceOptions {
  ChoiceOptions({
    this.name,
    this.title,
    this.options,
  });

  ChoiceOptions.fromJson(dynamic json) {
    name = json['name'];
    title = json['title'];
    options = json['options'] != null ? json['options'].cast<String>() : [];
  }
  String? name;
  String? title;
  List<String>? options;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['title'] = title;
    map['options'] = options;
    return map;
  }
}

class Photos {
  Photos({
    this.variant,
    this.path,
  });

  Photos.fromJson(dynamic json) {
    variant = json['variant'];
    path = json['path'];
  }
  String? variant;
  String? path;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['variant'] = variant;
    map['path'] = path;
    return map;
  }
}

// /// data : [{"id":126998,"name":"ميدزانا جهاز ضغط ديجيتال usb ","added_by":"seller","seller_id":1104,"shop_id":504,"shop_name":"سـهل ميـديكـال","shop_logo":"https://doctorpharmaco.com/public/uploads/all/czZfUG1X6ZmpeUZB1pSG5ZZclq9tF3dfVsdUqmas.jpg","photos":[{"variant":"","path":"https://doctorpharmaco.com/public"}],"thumbnail_image":"https://doctorpharmaco.com/public","tags":["Best Selling"," ميدزانا جهاز ضغط ديجيتال usb "],"price_high_low":"ج.م492.00","choice_options":[],"colors":[],"has_discount":true,"discount":"-20%","stroked_price":"ج.م615.00","main_price":"ج.م492.00","calculable_price":492,"currency_symbol":"ج.م","current_stock":46,"unit":" ","rating":0,"rating_count":0,"earn_point":10,"description":"ميدزانا جهاز ضغط ديجيتال usb ","video_link":"","brand":{"id":76,"name":"الجيزة","logo":"https://doctorpharmaco.com/public/uploads/all/UgXMp7sEExjYb2glHwFgzTmIClybJAWZYSrY8m9r.jpg"},"link":"https://doctorpharmaco.com/product/mydzana-ghaz-dght-dygytal-usb"}]
// /// success : true
// /// status : 200
//
// class ProductModel {
//   ProductModel({
//     this.data,
//     this.success,
//     this.status,
//   });
//
//   ProductModel.fromJson(dynamic json) {
//     if (json['data'] != null) {
//       data = [];
//       json['data'].forEach((v) {
//         data?.add(Data.fromJson(v));
//       });
//     }
//     success = json['success'];
//     status = json['status'];
//   }
//   List<Data>? data;
//   bool? success;
//   num? status;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (data != null) {
//       map['data'] = data?.map((v) => v.toJson()).toList();
//     }
//     map['success'] = success;
//     map['status'] = status;
//     return map;
//   }
// }
//
// /// id : 126998
// /// name : "ميدزانا جهاز ضغط ديجيتال usb "
// /// added_by : "seller"
// /// seller_id : 1104
// /// shop_id : 504
// /// shop_name : "سـهل ميـديكـال"
// /// shop_logo : "https://doctorpharmaco.com/public/uploads/all/czZfUG1X6ZmpeUZB1pSG5ZZclq9tF3dfVsdUqmas.jpg"
// /// photos : [{"variant":"","path":"https://doctorpharmaco.com/public"}]
// /// thumbnail_image : "https://doctorpharmaco.com/public"
// /// tags : ["Best Selling"," ميدزانا جهاز ضغط ديجيتال usb "]
// /// price_high_low : "ج.م492.00"
// /// choice_options : []
// /// colors : []
// /// has_discount : true
// /// discount : "-20%"
// /// stroked_price : "ج.م615.00"
// /// main_price : "ج.م492.00"
// /// calculable_price : 492
// /// currency_symbol : "ج.م"
// /// current_stock : 46
// /// unit : " "
// /// rating : 0
// /// rating_count : 0
// /// earn_point : 10
// /// description : "ميدزانا جهاز ضغط ديجيتال usb "
// /// video_link : ""
// /// brand : {"id":76,"name":"الجيزة","logo":"https://doctorpharmaco.com/public/uploads/all/UgXMp7sEExjYb2glHwFgzTmIClybJAWZYSrY8m9r.jpg"}
// /// link : "https://doctorpharmaco.com/product/mydzana-ghaz-dght-dygytal-usb"
//
// class Data {
//   Data({
//     this.id,
//     this.name,
//     this.addedBy,
//     this.sellerId,
//     this.shopId,
//     this.shopName,
//     this.shopLogo,
//     this.photos,
//     this.thumbnailImage,
//     this.tags,
//     this.priceHighLow,
//     this.choiceOptions,
//     this.colors,
//     this.hasDiscount,
//     this.discount,
//     this.strokedPrice,
//     this.mainPrice,
//     this.calculablePrice,
//     this.currencySymbol,
//     this.currentStock,
//     this.unit,
//     this.rating,
//     this.ratingCount,
//     this.earnPoint,
//     this.description,
//     this.videoLink,
//     this.brand,
//     this.link,
//   });
//
//   Data.fromJson(dynamic json) {
//     id = json['id'];
//     name = json['name'];
//     addedBy = json['added_by'];
//     sellerId = json['seller_id'];
//     shopId = json['shop_id'];
//     shopName = json['shop_name'];
//     shopLogo = json['shop_logo'];
//     if (json['photos'] != null) {
//       photos = [];
//       json['photos'].forEach((v) {
//         photos?.add(Photos.fromJson(v));
//       });
//     }
//     thumbnailImage = json['thumbnail_image'];
//     tags = json['tags'] != null ? json['tags'].cast<String>() : [];
//     priceHighLow = json['price_high_low'];
//     if (json['choice_options'] != null) {
//       choiceOptions = [];
//       json['choice_options'].forEach((v) {
//         choiceOptions?.add(v);
//       });
//     }
//     if (json['colors'] != null) {
//       colors = [];
//       json['colors'].forEach((v) {
//         colors?.add(v);
//       });
//     }
//     hasDiscount = json['has_discount'];
//     discount = json['discount'];
//     strokedPrice = json['stroked_price'];
//     mainPrice = json['main_price'];
//     calculablePrice = json['calculable_price'];
//     currencySymbol = json['currency_symbol'];
//     currentStock = json['current_stock'];
//     unit = json['unit'];
//     rating = json['rating'];
//     ratingCount = json['rating_count'];
//     earnPoint = json['earn_point'];
//     description = json['description'];
//     videoLink = json['video_link'];
//     brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
//     link = json['link'];
//   }
//   num? id;
//   String? name;
//   String? addedBy;
//   num? sellerId;
//   num? shopId;
//   String? shopName;
//   String? shopLogo;
//   List<Photos>? photos;
//   String? thumbnailImage;
//   List<String>? tags;
//   String? priceHighLow;
//   List<dynamic>? choiceOptions;
//   List<dynamic>? colors;
//   bool? hasDiscount;
//   String? discount;
//   String? strokedPrice;
//   String? mainPrice;
//   num? calculablePrice;
//   String? currencySymbol;
//   num? currentStock;
//   String? unit;
//   num? rating;
//   num? ratingCount;
//   int? earnPoint;
//   String? description;
//   String? videoLink;
//   Brand? brand;
//   String? link;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['name'] = name;
//     map['added_by'] = addedBy;
//     map['seller_id'] = sellerId;
//     map['shop_id'] = shopId;
//     map['shop_name'] = shopName;
//     map['shop_logo'] = shopLogo;
//     if (photos != null) {
//       map['photos'] = photos?.map((v) => v.toJson()).toList();
//     }
//     map['thumbnail_image'] = thumbnailImage;
//     map['tags'] = tags;
//     map['price_high_low'] = priceHighLow;
//     if (choiceOptions != null) {
//       map['choice_options'] = choiceOptions?.map((v) => v.toJson()).toList();
//     }
//     if (colors != null) {
//       map['colors'] = colors?.map((v) => v.toJson()).toList();
//     }
//     map['has_discount'] = hasDiscount;
//     map['discount'] = discount;
//     map['stroked_price'] = strokedPrice;
//     map['main_price'] = mainPrice;
//     map['calculable_price'] = calculablePrice;
//     map['currency_symbol'] = currencySymbol;
//     map['current_stock'] = currentStock;
//     map['unit'] = unit;
//     map['rating'] = rating;
//     map['rating_count'] = ratingCount;
//     map['earn_point'] = earnPoint;
//     map['description'] = description;
//     map['video_link'] = videoLink;
//     if (brand != null) {
//       map['brand'] = brand?.toJson();
//     }
//     map['link'] = link;
//     return map;
//   }
// }
//
// /// id : 76
// /// name : "الجيزة"
// /// logo : "https://doctorpharmaco.com/public/uploads/all/UgXMp7sEExjYb2glHwFgzTmIClybJAWZYSrY8m9r.jpg"
//
// class Brand {
//   Brand({
//     this.id,
//     this.name,
//     this.logo,
//   });
//
//   Brand.fromJson(dynamic json) {
//     id = json['id'];
//     name = json['name'];
//     logo = json['logo'];
//   }
//   num? id;
//   String? name;
//   String? logo;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['name'] = name;
//     map['logo'] = logo;
//     return map;
//   }
// }
//
// /// variant : ""
// /// path : "https://doctorpharmaco.com/public"
//
// class Photos {
//   Photos({
//     this.variant,
//     this.path,
//   });
//
//   Photos.fromJson(dynamic json) {
//     variant = json['variant'];
//     path = json['path'];
//   }
//   String? variant;
//   String? path;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['variant'] = variant;
//     map['path'] = path;
//     return map;
//   }
// }
