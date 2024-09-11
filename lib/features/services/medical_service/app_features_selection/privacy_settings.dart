import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/services/medical_service/presentation/widgets/custom_switch_list_title_widget/custom_switch_list_title_widget.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';

class PrivacySetting extends StatefulWidget {
  const PrivacySetting({super.key});

  @override
  State<PrivacySetting> createState() => _PrivacySettingState();
}

class _PrivacySettingState extends State<PrivacySetting> {
  bool emailLogin = false;
  bool socialLogin = false;
  bool biometricLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        showBackArrow: true,
        title: Text(
          S.current.privacy_settings,
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomSwitchListTitleWidget(
            title: S.current.control_visibility,
            value: emailLogin,
            onChanged: (bool value) {
              setState(() {
                emailLogin = value;
              });
            },
          ),
          CustomSwitchListTitleWidget(
            title: S.current.manage_data,
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
              maxLines: 5,
              decoration: InputDecoration(hintText: "أضف المزيد من التفاصيل"),
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
