import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/model/flashDealModel.dart';
import '../../data/repositories/FlashTodayDealModel.dart';
import '../../data/repositories/flashRepo.dart';

part 'flash_state.dart';

class FlashCubit extends Cubit<FlashState> {
  late FlashDealModel flashModel;
  late FlashTodayDealModel flashTodayModel;
  DateTime currentDate = DateTime.now();
  int hours = 0, minutes = 0, seconds = 0;
  flashRepositoryImp flashRepo = flashRepositoryImp();
  FlashCubit() : super(FlashInitial());
  List<dynamic> FlashTodayCertainCompany = [];

  Future<void> fetchFlashData() async {
    emit(FlashLoadingState());
    flashModel = await flashRepo.getFlashModel();
    if (flashModel.data!.length > 0) {
      CalcData();
    }

    emit(FlashSuccessState());
  }

  Future<void> fetchFlashTodayData() async {
    emit(FlashTodayLoadingState());
    flashTodayModel = await flashRepo.getFlashTodayModel();
    emit(FlashTodaySuccessState());
  }

  Future<void> fetchCertainCompanyFlashTodayData(
      {required String companyName}) async {
    emit(FlashTodayCertianComanyLoadingState());
    FlashTodayCertainCompany.clear();
    flashTodayModel.data!.forEach((element) {
      print(element.shopName);
      if (element.shopName == companyName) {
        FlashTodayCertainCompany.add(element);
      }
    });
    emit(FlashTodayCertianComanySuccessState());
  }

  CalcData() {
    int unixTimestamp = flashModel.data![0].date!.toInt();
    DateTime date = DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
    Duration difference = currentDate.difference(date);
    hours = difference.inHours;
    minutes = difference.inMinutes.remainder(60);
    seconds = difference.inSeconds.remainder(60);
    emit(FlashSuccessState());
  }
}
