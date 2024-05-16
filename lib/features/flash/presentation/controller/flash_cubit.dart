import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/model/flashDealModel.dart';
import '../../data/repositories/flashRepo.dart';

part 'flash_state.dart';

class FlashCubit extends Cubit<FlashState> {
  late FlashDealModel flashModel;
  DateTime currentDate = DateTime.now();
  int hours = 0, minutes = 0, seconds = 0;
  flashRepositoryImp flashRepo = flashRepositoryImp();
  FlashCubit() : super(FlashInitial());

  Future<void> fetchFlashData() async {
    flashModel = await flashRepo.getFlashModel();
    CalcData();
    emit(FlashSuccessState());
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
