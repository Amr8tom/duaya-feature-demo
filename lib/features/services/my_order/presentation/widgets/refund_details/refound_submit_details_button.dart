import 'package:duaya_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';

class RefoundSubmitDetailsButton extends StatelessWidget {
  const RefoundSubmitDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(
            Size(196.w, 10.h), // Adjust button size
          ),
        ),
        onPressed: () {},
        child: Text(
          S.current.sendProduct,
          style: TextStyle(color: ColorRes.white),
        ));
  }
}
