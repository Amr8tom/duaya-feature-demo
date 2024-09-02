import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:duaya_app/features/payment/data/Model/pay_information_entitiy.dart';
import 'package:duaya_app/utils/error/failure.dart';

import '../../../utils/constants/api_constants.dart';
import 'Model/invoice_init_pay_model.dart';

abstract class PaymentServices {
  Future<Either<Failure, InvoiceInitPayModel>> submitPayment(
      {required String apiKey, required PayInformationEntitiy payInfo});
}

class FawaterkServices implements PaymentServices {
  final Dio dio;

  FawaterkServices({required this.dio});

  @override
  Future<Either<Failure, InvoiceInitPayModel>> submitPayment(
      {required String apiKey, required PayInformationEntitiy payInfo}) async {
    print("price========================>${payInfo.price}");
    print("price========================>${payInfo.price}");
    print("price========================>${payInfo.price}");
    print("price========================>${payInfo.price}");
    print("price========================>${payInfo.price}");
    try {
      final data = {
        "payment_method_id": payInfo.paymentMethodID,
        "cartTotal": payInfo.price,
        "currency": payInfo.currency,
        // "mobileNumber": payInfo.mobileWallet ?? payInfo.phone,
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
        "cartItems": payInfo.Items.map((item) {
          int? price = item.price?.toDouble().round();
          return {
            "name": item.productName.toString() ?? '',
            "price": price.toString(),
            "quantity": item.quantity.toString(),
          };
        }).toList()
      };
      print(data);
      final Response response = await dio.post(
        '${URL.fawaterk}/api/v2/invoiceInitPay',
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $apiKey',
          },
        ),
      );
      print(response.data);
      print(response.data);
      print(response.data);
      final InvoiceInitPayModel invoiceInit =
          await InvoiceInitPayModel.fromJson(response.data);
      return right(invoiceInit);
    } catch (e) {
      print(e);
      return left(ServerFailure(message: "Failure in payment"));
    }
  }
}
