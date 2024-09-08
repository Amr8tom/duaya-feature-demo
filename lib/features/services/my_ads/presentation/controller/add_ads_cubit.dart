import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:duaya_app/features/services/my_ads/domain/usecases/add_ads_usecase.dart';
import 'package:meta/meta.dart';

part 'add_ads_state.dart';

class AddAdsCubit extends Cubit<AddAdsState> {
  final AddAdsUsecase usecase;
  AddAdsCubit({required this.usecase}) : super(AddAdsInitial());

  Future addAdsUseCase({required FormData params}) async {
    emit(AddAdsLoading());
    try {
      await usecase.call(params: params);
      emit(AddAdsSuccess());
    } catch (e) {
      print("error =====================================================> $e");
      emit(AddAdsFailure());
    }
  }
}
