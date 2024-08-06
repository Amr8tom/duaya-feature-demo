import 'package:duaya_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../generated/l10n.dart';

class CustomRechargeForm extends StatelessWidget {
  const CustomRechargeForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController amountControlelr = TextEditingController();
    TextEditingController PaymentControlelr = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          height: 200.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
              color: ColorRes.greyGreen,
              borderRadius: BorderRadius.circular(10.r)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _TextFormFiled(
                  isNumber: true,
                  context: context,
                  title: S.current.amount,
                  controller: amountControlelr),
              _TextFormFiled(
                  isNumber: false,
                  context: context,
                  title: S.current.choosePaymentMethod,
                  controller: PaymentControlelr),
              InkWell(
                  onTap: () {},
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.sp),
                      width: 170.w,
                      decoration: BoxDecoration(
                          color: ColorRes.greenBlue,
                          borderRadius: BorderRadius.circular(50.r)),
                      child: Center(
                        child: Text(
                          S.current.confirmPayment,
                          style: TextStyle(
                              color: ColorRes.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 18.sp),
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}

Widget _TextFormFiled(
    {required BuildContext context,
    required String title,
    required bool isNumber,
    required TextEditingController controller}) {
  return Row(
    children: [
      Expanded(
          flex: 3,
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: ColorRes.greenBlue, fontSize: 16.sp),
          )),
      Expanded(
          flex: 7,
          child: TextFormField(
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            controller: controller,
          )),
    ],
  );
}

Widget _DropDownList(
    {required BuildContext context,
    required String title,
    required bool isNumber,
    required TextEditingController controller}) {
  return Row(
    children: [
      Expanded(
          flex: 3,
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: ColorRes.greenBlue, fontSize: 16.sp),
          )),
      Expanded(
          flex: 7,
          child: DropdownMenuItem(
            child: Text("IDK"),
          )),
    ],
  );
}
