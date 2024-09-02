import 'package:bloc/bloc.dart';
import 'package:duaya_app/features/services/my_order/domain/usecases/get_order_items_usecase.dart';
import 'package:meta/meta.dart';

import '../../../data/model/order_items_model.dart';

part 'orer_items_state.dart';

class OrerItemsCubit extends Cubit<OrerItemsState> {
  final GetOrderItemsUsecase _getOrderItemsUsecase;
  OrerItemsCubit(this._getOrderItemsUsecase) : super(OrerItemsLoading());

  Future fetchOrderItems({required String orderID}) async {
    final result = await _getOrderItemsUsecase.call(orderID: orderID);
    return result.fold((f) => emit(OrerItemsFailure()),
        (orderItems) => emit(OrerItemsSuccess(orderItems: orderItems)));
  }
}
