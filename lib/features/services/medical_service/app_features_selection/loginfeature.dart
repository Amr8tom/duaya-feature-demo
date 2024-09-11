import 'package:duaya_app/app/app.dart';
import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';

class SecurityLoginScreen extends StatefulWidget {
  @override
  _SecurityLoginScreenState createState() => _SecurityLoginScreenState();
}

class _SecurityLoginScreenState extends State<SecurityLoginScreen> {
  bool emailLogin = false;
  bool socialLogin = false;
  bool biometricLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        arrowBackColor: true,
        title: Text(
          S.current.security_and_login,
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: Text(S.current.email_login),
            value: emailLogin,
            onChanged: (bool value) {
              setState(() {
                emailLogin = value;
              });
            },
          ),
          SwitchListTile(
            title: Text(S.current.social_login),
            value: socialLogin,
            onChanged: (bool value) {
              setState(() {
                socialLogin = value;
              });
            },
          ),
          SwitchListTile(
            title: Text(S.current.biometric_login),
            value: biometricLogin,
            onChanged: (bool value) {
              setState(() {
                biometricLogin = value;
              });
            },
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
