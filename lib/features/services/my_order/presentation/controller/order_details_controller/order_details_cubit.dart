import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/order_details.dart';
import '../../../domain/usecases/get_order_details_usecase.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  final GetOrderDetailsUsecase _getOrderDetailsUsecase;
  OrderDetailsCubit(this._getOrderDetailsUsecase)
      : super(OrderDetailsInitial());

  Future fetchOrderDetails({required String orderID}) async {
    emit(OrderDetailsLoading());
    final result = await _getOrderDetailsUsecase.call(orderID: orderID);
    return result.fold(
        (f) => emit(OrderDetailsFailure()),
        (orderDetails) =>
            emit(OrderDetailsSuccessed(orderDetails: orderDetails)));
  }
}
