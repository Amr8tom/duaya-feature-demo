import 'package:duaya_app/app/app.dart';
import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/services/medical_service/presentation/widgets/custom_switch_list_title_widget/custom_switch_list_title_widget.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';

class LabTestResults extends StatefulWidget {
  const LabTestResults({super.key});

  @override
  State<LabTestResults> createState() => _LabTestResultsState();
}

class _LabTestResultsState extends State<LabTestResults> {
  bool emailLogin = false;
  bool socialLogin = false;
  bool biometricLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        centerTitle: true,
        showBackArrow: true,
        title: Text(
          S.current.lab_test_results,
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomSwitchListTitleWidget(
            title: S.current.receive_lab_results,
            value: emailLogin,
            onChanged: (bool value) {
              setState(() {
                emailLogin = value;
              });
            },
          ),
          CustomSwitchListTitleWidget(
            title: S.current.lab_results_notifications,
            value: socialLogin,
            onChanged: (bool value) {
              setState(() {
                socialLogin = value;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              maxLines: 4,
              decoration:
                  InputDecoration(hintText: "اكتب بالتفاصيل انواع الاشعارات"),
            ),
          ),
          TextButton(
            onPressed: () {
              // Save the settings and navigate back
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: ColorRes.greenBlueLight,
                  border: Border.all(width: 1, color: ColorRes.greenBlue),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                S.current.saveChanges,
                style: TextStyle(color: ColorRes.greenBlue),
              )),
              width: 150.w,
              height: 50.h,
            ),
          ),
        ],
      ),
    );
  }
}
