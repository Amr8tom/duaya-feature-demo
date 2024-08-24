import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'customer_ads_state.dart';

class CustomerAdsCubit extends Cubit<CustomerAdsState> {
  CustomerAdsCubit() : super(CustomerAdsInitial());
}
