class InvoiceInitPayModel {
  InvoiceInitPayModel({
    this.status,
    this.data,
  });

  InvoiceInitPayModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.invoiceId,
    this.invoiceKey,
    this.paymentData,
  });

  Data.fromJson(dynamic json) {
    invoiceId = json['invoice_id'];
    invoiceKey = json['invoice_key'];
    paymentData = json['payment_data'] != null
        ? PaymentData.fromJson(json['payment_data'])
        : null;
  }
  num? invoiceId;
  String? invoiceKey;
  PaymentData? paymentData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['invoice_id'] = invoiceId;
    map['invoice_key'] = invoiceKey;
    if (paymentData != null) {
      map['payment_data'] = paymentData?.toJson();
    }
    return map;
  }
}

class PaymentData {
  PaymentData(
      {this.fawryCode,
      this.expireDate,
      this.meezaQrCode,
      this.meezaReference,
      this.redirectTo});

  PaymentData.fromJson(dynamic json) {
    fawryCode = json['fawryCode'];
    expireDate = json['expireDate'];
    redirectTo = json['redirectTo'];
    meezaQrCode = json['meezaQrCode'];
    meezaReference = json['meezaReference'];
  }
  String? fawryCode;
  String? expireDate;
  String? redirectTo;
  String? meezaQrCode;
  int? meezaReference;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['meezaQrCode'] = meezaQrCode;
    map['meezaReference'] = meezaReference;
    map['fawryCode'] = fawryCode;
    map['expireDate'] = expireDate;
    map['redirectTo'] = redirectTo;
    return map;
  }
}
