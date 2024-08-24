import 'package:dio/dio.dart';
import 'package:duaya_app/features/payment/data/Model/pay_information_entitiy.dart';
import 'package:duaya_app/utils/error/failure.dart';

import '../../../utils/constants/api_constants.dart';

abstract class PaymentServices {
  Future submitPayment(
      {required String apiKey, required PayInformationEntitiy payInfo});
}

class PaymentFawaterk implements PaymentServices {
  final Dio dio;

  PaymentFawaterk(this.dio);

  @override
  Future submitPayment(
      {required String apiKey, required PayInformationEntitiy payInfo}) async {
    try {
      final Response response = await dio.post(
        '${URL.fawaterk}/api/v2/invoiceInitPay',
        data: {
          "payment_method_id": payInfo.paymentMethodID,
          "cartTotal": payInfo.price,
          "currency": payInfo.currency,
          "customer": {
            "first_name": payInfo.firstName,
            "last_name": payInfo.lastName,
            "email": payInfo.email,
            "phone": payInfo.phone,
            "address": payInfo.address
          },
          "redirectionUrls": {
            "successUrl": URL.fawaterkSuccess,
            "failUrl": URL.fawaterkFail,
            "pendingUrl": URL.fawaterkPending
          },
          "cartItems": [
            {
              "name": payInfo.itemName,
              "price": payInfo.price,
              "quantity": payInfo.quantitiy
            }
          ]
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $apiKey',
          },
        ),
      );
      return response.data;
    } catch (e) {
      print(e);
      throw ServerFailure(message: "Failure in payment");
    }
  }
}
