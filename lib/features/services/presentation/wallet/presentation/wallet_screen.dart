import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/services/presentation/wallet/presentation/controller/wallet_cubit.dart';
import 'package:duaya_app/features/services/presentation/wallet/presentation/widgets/custom_container_balance.dart';

import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/custom_container_transaction_history.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WalletCubit()..fetchWalletData(),
      child: Scaffold(
        appBar: DAppBar(
          title: Text(S.current.myWallet),
          centerTitle: true,
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.spaceBtwItems),
            child: Column(
              children: [
                /// Container Balance
                const CustomContainerBalance(),

                /// Make Space
                SizedBox(height: AppSizes.spaceBtwItems / 1.2),

                /// Container Transaction
                CustomContainerTransactionHistory()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
