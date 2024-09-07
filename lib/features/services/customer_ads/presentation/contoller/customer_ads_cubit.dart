import 'package:bloc/bloc.dart';
import 'package:duaya_app/features/services/customer_ads/data/models/ad_details_model.dart';
import 'package:duaya_app/features/services/customer_ads/data/models/get_all_customer_ads.dart';
import 'package:duaya_app/features/services/customer_ads/domain/usecases/get_all_customer_ads_usecase.dart';
import 'package:duaya_app/features/services/customer_ads/domain/usecases/get_customer_ad_details_usecase.dart';
import 'package:meta/meta.dart';
part 'customer_ads_state.dart';

class CustomerAdsCubit extends Cubit<CustomerAdsState> {
  final GetAllCustomerAdsUsecase _allCustomerAdsUsecaseusecase;
  final GetCustomerAdDetailsUsecase _adDetailsUsecase;
  CustomerAdsCubit(this._allCustomerAdsUsecaseusecase, this._adDetailsUsecase)
      : super(CustomerAdsInitial());

  Future getAllCustomerAds() async {
    final result = await _allCustomerAdsUsecaseusecase.call();
    return result.fold((f) => emit(CustomerAdsFailure()),
        (allAds) => emit(CustomerAdsSuccess(customerAds: allAds)));
  }

  Future getCustomerAdsDetails() async {
    final result = await _adDetailsUsecase.call();
    return result.fold(
        (f) => emit(CustomerAdsFailure()),
        (adDetails) =>
            emit(CustomerAdsDetailsSuccess(adDetailsModel: adDetails)));
  }
}
