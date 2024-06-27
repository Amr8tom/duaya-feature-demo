class WalletBalanceModel {
  WalletBalanceModel({
    this.balance,
    this.lastRecharged,
  });

  WalletBalanceModel.fromJson(dynamic json) {
    balance = json['balance'];
    lastRecharged = json['last_recharged'];
  }
  String? balance;
  String? lastRecharged;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['balance'] = balance;
    map['last_recharged'] = lastRecharged;
    return map;
  }
}
