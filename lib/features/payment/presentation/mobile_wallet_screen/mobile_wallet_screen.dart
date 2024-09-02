import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/custom_ui.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/constants/colors.dart';
import '../controller/payment_cubit.dart';
import '../widgets/mobile_wallet/mobile_wallet_body.dart';
import '../widgets/mobile_wallet/mobile_wallet_body_init.dart';

class MobileWalletScreen extends StatelessWidget {
  const MobileWalletScreen({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<PaymentCubit>().init();
    return Scaffold(
      appBar: DAppBar(
        centerTitle: true,
        showBackArrow: true,
        // backgroundColor: ColorRes.lightGreen,
        title: Text(
          S.current.mobileWallet,
        ),
      ),
      body: BlocBuilder<PaymentCubit, PaymentState>(
        builder: (context, state) {
          if (state is PaymentSucessed) {
            return MobileWalletBody(
                QRCode: state.invoiceModel?.data?.paymentData?.meezaQrCode
                    .toString());
          } else if (state is PaymentFailure) {
            return Center(child: CustomUI.tryLater());
          } else if (state is PaymentLoading) {
            return CustomUI.simpleLoader();
          } else {
            return const MobileWalletBodyInit();
          }
        },
      ),
    );
  }
}
