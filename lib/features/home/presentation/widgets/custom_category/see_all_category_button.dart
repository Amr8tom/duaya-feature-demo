import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../utils/constants/colors.dart';

class SeeAllCategoryButton extends StatelessWidget {
  const SeeAllCategoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(S.current.categories,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: ColorRes.greenBlue)),
        const Spacer(),
        IconButton(
          onPressed: () {
            context.pushNamed(DRoutesName.categoriesRoute);
          },
          icon: Text(S.current.seeAll,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: ColorRes.greenBlue)),
        ),
        Icon(Icons.arrow_forward_ios, size: 12.sp, color: ColorRes.greenBlue)
      ],
    );
  }
}
