import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';

class MobileWalletBody extends StatelessWidget {
  final String? QRCode;
  const MobileWalletBody({super.key, required this.QRCode});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              color: ColorRes.lightGreen.withOpacity(0.3),
              child: Lottie.asset(
                AssetRes.mobileWallet,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: ColorRes.greenBlueLight,
                borderRadius: BorderRadius.circular(15.sp),
                border: Border.all(width: 1.sp, color: ColorRes.greenBlue),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 70.0.sp, vertical: 8.sp),
                    child: Text(
                      S.current.QRCodeDes,
                      style: Theme.of(context).textTheme.headlineMedium!,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 70.0.sp, vertical: 8.sp),
                    child: Text(
                      S.current.mobilWalletOption,
                      style: Theme.of(context).textTheme.headlineMedium!,
                    ),
                  ),
                  QRCode == null
                      ? Text(
                          S.current.error,
                          style: Theme.of(context).textTheme.headlineMedium!,
                        )
                      : QrImageView(
                          data: QRCode!,
                          size: 200,
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
