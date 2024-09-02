import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/common_snak_bar_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../utils/constants/colors.dart';

class CustomVoiceHelperBotton extends StatefulWidget {
  const CustomVoiceHelperBotton({super.key});

  @override
  State<CustomVoiceHelperBotton> createState() =>
      _CustomVoiceHelperBottonState();
}

class _CustomVoiceHelperBottonState extends State<CustomVoiceHelperBotton> {
  @override
  Widget build(BuildContext context) {
    bool isHelpWithAvatar = true;
    return Positioned(
      bottom: 2.sp,
      right: 10,
      child: IconButton(
        onPressed: () {
          setState(() {
            isHelpWithAvatar = !isHelpWithAvatar; // Toggle the state
          });
          commonToast(
              "لقد تم تشغيل المساعده الصوتية انقر علي الايكونات المتاحة امامك لمعرفة خاصية كل واحدة منهم");
        },
        icon: Column(
          children: [
            Icon(
              isHelpWithAvatar ? Icons.help : Icons.help_outline,
              size: 40.sp,
              color: ColorRes.lightGreen,
            ),
            Text(S.current.helper),
          ],
        ),
      ),
    );
  }
}
