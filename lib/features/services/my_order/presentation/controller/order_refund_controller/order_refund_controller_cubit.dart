import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'order_refund_controller_state.dart';

class OrderRefundControllerCubit extends Cubit<OrderRefundControllerState> {
  OrderRefundControllerCubit() : super(OrderRefundControllerloading());
}
