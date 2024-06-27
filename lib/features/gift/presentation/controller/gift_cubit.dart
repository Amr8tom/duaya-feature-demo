import 'package:bloc/bloc.dart';
import 'package:duaya_app/features/gift/data/model/UserAndGiftModel.dart';
import 'package:duaya_app/features/gift/data/repositories/gift_repository.dart';
import 'package:meta/meta.dart';

part 'gift_state.dart';

class GiftCubit extends Cubit<GiftState> {
  GiftCubit() : super(GiftInitial());
  late UserAndGiftModel GiftModel;
  double money = 0.00;
  String balance = "00,0";

  GiftRepositoryImpl repo = GiftRepositoryImpl();
  Future<void> fetchGiftData() async {
    emit(GiftILoadingData());
    GiftModel = await repo.getGiftModel();
    money = GiftModel.minAmount! / 100 ?? 0.0;
    balance = GiftModel.balance.toString();
    emit(GiftISuccessData());
  }
}
