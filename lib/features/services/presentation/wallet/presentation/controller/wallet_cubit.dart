import 'package:bloc/bloc.dart';
import 'package:duaya_app/features/services/presentation/wallet/data/model/wallet_balance.dart';
import 'package:duaya_app/features/services/presentation/wallet/data/model/wallet_history.dart';
import 'package:meta/meta.dart';

import '../../../../../../generated/l10n.dart';
import '../../data/repositories/wallet_repo.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletInitial());
  WalletReposoitoryImp repo = WalletReposoitoryImp();
  String balance = S.current.loading;
  List<Data> transactions = [];
  late WalletBalanceModel BalanceModel;
  late WalletHistory historyModel;

  Future<void> fetchWalletData() async {
    emit(WalletDataFetchedLoading());
    transactions.clear();
    BalanceModel = await repo.getWalletBalance();
    historyModel = await repo.getWalletHistory();
    historyModel.data!.forEach((element) {
      transactions.add(element);
    });
    print(
        "transactions.lengthtransactions.lengthtransactions.lengthtransactions.lengthtransactions.length");
    print(transactions.length);
    // print(transactions[0].date);
    // print(transactions[0].date);
    balance = BalanceModel.balance!;
    emit(WalletDataFetchedSuccess());
  }
}
