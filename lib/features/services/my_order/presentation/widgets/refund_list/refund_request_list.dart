import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_container/custom_order_contanier.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../routing/routes_name.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class RefundRequestList extends StatelessWidget {
  const RefundRequestList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(height: AppSizes.spaceBtwItems);
        },
        itemCount: 12,
        itemBuilder: (context, index) {
          return CustomOrderContanier(
            isRowLeftBotton: false,
            isRefund: true,
            isDelevied: false,
            leftBotton: S.current.details,
            onLeftButtonTap: () =>
                context.pushNamed(DRoutesName.returnRequestDeatilsRoute),
            image: AssetRes.refundIcon,
            divideNum: 5,
            title: S.current.color,
            body: S.current.search,
          );
        });
    ;
  }
}
