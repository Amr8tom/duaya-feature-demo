import 'package:bloc/bloc.dart';
import 'package:duaya_app/common/common_snak_bar_widget.dart';
import 'package:duaya_app/features/gift/data/model/convert_clubpoint_model.dart';
import 'package:duaya_app/features/gift/data/repositories/gift_repository.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../generated/l10n.dart';
import '../../data/model/get_clubpoint_model.dart';

part 'gift_state.dart';

class GiftCubit extends Cubit<GiftState> {
  GiftCubit() : super(GiftInitial());
  late GetClubpointModel GiftModel;
  late ConvertClubpointModel convertModel;
  double money = 0.00;
  String balance = "00,0";

  GiftRepositoryImpl repo = GiftRepositoryImpl();
  Future<void> fetchGiftData() async {
    emit(GiftILoadingData());
    GiftModel = await repo.getGiftModel();
    if (GiftModel.data?.length == 0) {
      emit(GiftINoData());
    }
    money = GiftModel.data![0].points! / 100 ?? 0.0;
    balance = GiftModel.data![0].points!.toString();
    if (GiftModel.data![0].convertStatus?.toInt() == 1) {
      money = 0;
      balance = 0.toString();
    }
    emit(GiftISuccessData());
  }

  Future<void> convertClubpoint({required BuildContext context}) async {
    emit(GiftILoadingData());
    if (GiftModel.data![0].convertStatus?.toInt() == 0) {
      convertModel = (await repo.convertClubpointModel(
          params: {"id": GiftModel.data![0].id.toString()}))!;
      commonToast(convertModel.message!);
      if (convertModel.success == true) {
        context.pop();
      }
    } else {
      context.pop();
      commonToast(S.current.tryLater);
    }
    emit(GiftISuccessData());
  }
}
