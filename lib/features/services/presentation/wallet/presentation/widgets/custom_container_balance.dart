import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../common/widgets/custom_container/wallet_container.dart';
import '../controller/wallet_cubit.dart';

class CustomContainerBalance extends StatelessWidget {
  const CustomContainerBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WalletCubit walletController = context.read<WalletCubit>();
    return BlocConsumer<WalletCubit, WalletState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return CustomContanerWallet(
          image: AssetRes.dollarSquare,
          title: S.current.yourBalance,
          body: S.current.walletTitle,
          pinText: walletController.balance,
          color: ColorRes.greyGreen,
        );
      },
    );
  }
}
