import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget WalletTransactionText(
    {required String Title,
    required String data,
    required BuildContext context}) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 9.sp),
      child: Row(
        children: [
          Text(data,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w900)),
          Spacer(),
          Text(Title,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.red, fontSize: 15.sp))
        ],
      ),
    ),
  );
}
