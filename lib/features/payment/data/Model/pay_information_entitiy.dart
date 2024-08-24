class PayInformationEntitiy {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String address;
  final String price;
  final String currency;
  final String quantitiy;
  final String itemName;
  final String paymentMethodID;

  PayInformationEntitiy({
    this.itemName = "test",
    required this.quantitiy,
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
