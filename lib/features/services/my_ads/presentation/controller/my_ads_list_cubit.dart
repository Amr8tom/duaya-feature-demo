import 'package:bloc/bloc.dart';
import 'package:duaya_app/features/services/my_ads/data/models/my_Ads_list_model.dart';
import 'package:duaya_app/features/services/my_ads/domain/usecases/get_my_ads_usecase.dart';
import 'package:meta/meta.dart';

part 'my_ads_list_state.dart';

class MyAdsListCubit extends Cubit<MyAdsListState> {
  final GetMyAdsUsecase usecase;
  MyAdsListCubit({required this.usecase}) : super(MyAdsListInitial());

  Future getMyAdsList() async {
    emit(MyAdsListLoading());
    final result = await usecase.call();
    return result.fold(
      (f) => emit(MyAdsListFailure()),
      (myAds) => emit(MyAdsListSuccess(myAds: myAds)),
    );
  }
}
