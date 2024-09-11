import 'package:duaya_app/app/app.dart';
import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/services/medical_service/presentation/widgets/custom_switch_list_title_widget/custom_switch_list_title_widget.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';

class AddMoreFeaturesScreen extends StatefulWidget {
  const AddMoreFeaturesScreen({super.key});

  @override
  State<AddMoreFeaturesScreen> createState() => _AddMoreFeaturesScreenState();
}

class _AddMoreFeaturesScreenState extends State<AddMoreFeaturesScreen> {
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
          S.current.addMoreFeats,
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: "اكتب عدد الخصائص التي تريد اضافتها "),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: "أشرح لنا بايجاز ما هو الغرض من تطبيقك"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              maxLines: 8,
              decoration:
                  InputDecoration(hintText: " أشرح لنا بايجاز تفاصيل كلا منهم"),
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
