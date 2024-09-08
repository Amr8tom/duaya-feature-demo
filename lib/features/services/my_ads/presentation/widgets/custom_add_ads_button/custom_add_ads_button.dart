import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../routing/routes_name.dart';

class CustomAddAdsButton extends StatelessWidget {
  const CustomAddAdsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () => context.pushNamed(DRoutesName.addNewProductOrAdsRoute),
        child: Text(S.current.addProduct));
  }
}
