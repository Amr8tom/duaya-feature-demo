import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/widgets/custom_container/wallet_container.dart';

class CustomContainerRecharge extends StatelessWidget {
  const CustomContainerRecharge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(DRoutesName.rechargeWalletRoute);
      },
      child: CustomContanerWallet(
        image: AssetRes.cardPos,
        title: S.current.rechangreWallet,
        body: S.current.rechangreWalletBody,
      ),
    );
  }
}
