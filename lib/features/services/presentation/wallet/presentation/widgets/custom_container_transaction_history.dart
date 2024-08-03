import 'package:duaya_app/features/services/presentation/wallet/presentation/controller/wallet_cubit.dart';
import 'package:duaya_app/features/services/presentation/wallet/presentation/widgets/custom_transaction_text_data.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerTransactionHistory extends StatelessWidget {
  const CustomContainerTransactionHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WalletCubit walletController = context.read<WalletCubit>();
    return BlocConsumer<WalletCubit, WalletState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        // if (state is WalletDataFetchedSuccess) {
        return walletController.transactions.length > 0
            ? GridView.builder(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.spaceBtwTexts,
                    vertical: AppSizes.defaultSpace),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 2.2 / 1,
                    mainAxisSpacing: 8),
                shrinkWrap: true,
                itemCount: walletController.transactions.length,
                itemBuilder: (context, index) {
                  final transaction = walletController.transactions[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppSizes.borderRadiusLg),
                      color: ColorRes.black.withOpacity(0.1),
                      boxShadow: [
                        BoxShadow(
                          color: ColorRes.black.withOpacity(.3),
                          blurRadius: 2,
                          spreadRadius: 1,
                          offset: Offset(1.w, 1.h),
                        ),
                      ],
                    ),
                    child: Column(children: [
                      // Row(
                      //   children: [Text(transaction.amount!), Spacer(), Text("data")],
                      // ),
                      WalletTransactionText(
                          Title: "amount",
                          context: context,
                          data: transaction.amount!),
                      WalletTransactionText(
                          Title: "paymentMethod",
                          context: context,
                          data: transaction.paymentMethod!),
                      WalletTransactionText(
                          Title: "approvalString",
                          context: context,
                          data: transaction.approvalString!),
                      WalletTransactionText(
                          Title: "date",
                          context: context,
                          data: transaction.date!),
                    ]),
                  );
                },
              )
            : SizedBox();
        // }
        // return SizedBox();
      },
    );
  }
}
