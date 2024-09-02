import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:duaya_app/features/services/my_order/data/model/all_refund_request_model.dart';
import 'package:duaya_app/features/services/my_order/domain/usecases/get_all_refund_order_usecase.dart';
import 'package:duaya_app/utils/error/failure.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pinput/pinput.dart';
import '../../../data/model/send_refund_request_model.dart';
import '../../../domain/usecases/send_all_refund_usecase.dart';
part 'order_refund_controller_state.dart';

class OrderRefundControllerCubit extends Cubit<OrderRefundControllerState> {
  final SendAllRefundUsecase _usecase;
  final GetAllRefundOrderUsecase _usecase2;
  TextEditingController reasonController = TextEditingController();
  OrderRefundControllerCubit(this._usecase, this._usecase2)
      : super(OrderRefundControllerInitial());

  Future getAllRefundRequest() async {
    final result = await _usecase2.call();
    return result.fold(
        (f) => emit(OrderRefundControllerFailure()),
        (refundOrders) => emit(
            OrderRefundControllerSuccessed(refundRequestsModel: refundOrders)));
  }

  Future sendRefundRequest({required String orderID}) async {
    emit(OrderRefundControllerloading());
    if (reasonController.text == '' || reasonController.text == null) {
      return emit(OrderRefundControllerFailure());
    } else {
      try {
        final result = await _usecase.call(
            params: {"id": orderID, "reason": reasonController.text.trim()});
        reasonController.delete();
        return emit(OrderRefundControllerSuccessed(sendRefundModel: result));
      } catch (e) {
        print(
            "error =====================================================> $e");
        emit(OrderRefundControllerFailure());
      }
    }
  }
}
