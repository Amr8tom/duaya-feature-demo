import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../../../utils/error/failure.dart';
import '../../../data/model/all_orders_model.dart';
import '../../../domain/usecases/get_all_orders_usercase.dart';

part 'my_orders_state.dart';

class MyOrdersCubit extends Cubit<MyOrdersState> {
  final GetAllOrdersUseCase _getAllOrdersUseCase;
  MyOrdersCubit(this._getAllOrdersUseCase) : super(MyOrdersInitial());

  Future<void> fetchAllOrders() async {
    emit(MyOrdersLoading());
    final result = await _getAllOrdersUseCase.call();
    return result.fold(
      (f) => emit(MyOrdersError()),
      (orders) => emit(MyOrdersSuccess(ordersModel: orders)),
    );
  }
}
