import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import '../../../../../common/widgets/custom_container/custom_order_contanier.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../routing/routes_name.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class CurrentOrderList extends StatelessWidget {
  const CurrentOrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(height: AppSizes.spaceBtwItems);
        },
        itemCount: 12,
        itemBuilder: (context, index) {
          return CustomOrderContanier(
            isRowLeftBotton: true,
            isDelevied: false,
            rightBotton: S.current.details,
            leftBotton: S.current.followOrder,
            onLeftButtonTap: () =>
                context.pushNamed(DRoutesName.followOrderRoute),
            image: AssetRes.truck,
            title: S.current.color,
            body: S.current.search,
          );
        });
  }
}
