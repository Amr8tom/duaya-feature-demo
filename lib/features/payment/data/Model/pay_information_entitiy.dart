// import '../../../cart/data/model/ListItemModel.dart';

import '../../../cart/data/model/cart_model.dart';

class PayInformationEntitiy {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String address;
  String? mobileWallet;
  String price;
  List<CartItems> Items;
  final String currency;
  String quantitiy;
  String itemName;
  int paymentMethodID;

  PayInformationEntitiy({
    this.itemName = "test",
    required this.quantitiy,
    required this.Items,
    this.mobileWallet,
    required this.paymentMethodID,
    required this.price,
    this.currency = "EGP",
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.address,
  });
}
