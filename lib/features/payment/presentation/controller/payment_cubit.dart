import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:duaya_app/features/authentication/presentation/controller/auth_controller_cubit.dart';
import 'package:duaya_app/features/cart/presentation/widgets/controller/cart_cubit.dart';
import 'package:duaya_app/features/payment/data/Model/invoice_init_pay_model.dart';
import 'package:duaya_app/utils/constants/api_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../data/Model/pay_information_entitiy.dart';
import '../../data/services.dart';
part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentServices _fawaterkServices;
  PaymentCubit(this._fawaterkServices) : super(PaymentInitial());
  TextEditingController mobileController = TextEditingController();
  late PayInformationEntitiy _payInfo;
  void init() {
    emit(PaymentInitial());
  }

  void changePaymentMethod(
      {required int paymentMethodID,
      required BuildContext context,
      int? mobileNum}) {
    emit(PaymentInitial());
    final cartController = context.read<CartCubit>();
    final userController = context.read<AuthControllerCubit>();
    String? phone = mobileController.text.trim() == ''
        ? userController.userModel?.user?.phone.toString()
        : mobileController.text.trim();
    _payInfo = PayInformationEntitiy(
        quantitiy: cartController.Items!.length.toString(),
        Items: cartController.Items,
        paymentMethodID: paymentMethodID,
        price: cartController.total.round().toString(),
        firstName: userController.userModel?.user?.name.toString() ?? '',
        lastName: userController.userModel?.user?.id.toString() ?? '',
        email: userController.userModel?.user?.email.toString() ?? '',
        phone: phone ?? '',
        address: userController.userModel?.user?.jobName?.toString() ?? '',
        mobileWallet: phone);
    mobileController.clear();
  }

  Future Pay() async {
    emit(PaymentLoading());
    final result = await _fawaterkServices.submitPayment(
        apiKey: URL.fwaterkApi, payInfo: _payInfo);
    return result.fold((f) => emit(PaymentFailure()),
        (inVoiceModel) => emit(PaymentSucessed(invoiceModel: inVoiceModel)));
  }
}
