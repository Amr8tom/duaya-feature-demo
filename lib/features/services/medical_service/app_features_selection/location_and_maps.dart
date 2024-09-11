import 'package:duaya_app/app/app.dart';
import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';

class LocationAndMaps extends StatefulWidget {
  const LocationAndMaps({super.key});

  @override
  State<LocationAndMaps> createState() => _LocationAndMapsState();
}

class _LocationAndMapsState extends State<LocationAndMaps> {
  bool emailLogin = false;
  bool socialLogin = false;
  bool biometricLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        showBackArrow: true,
        title: Text(
          S.current.location_and_maps,
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: Text(S.current.enable_location),
            value: emailLogin,
            onChanged: (bool value) {
              setState(() {
                emailLogin = value;
              });
            },
          ),
          SwitchListTile(
            title: Text(S.current.use_maps),
            value: socialLogin,
            onChanged: (bool value) {
              setState(() {
                socialLogin = value;
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(hintText: " أضف المزيد من التفاصيل"),
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
