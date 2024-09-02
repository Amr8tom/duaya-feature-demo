import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/services/my_ads/widgets/custom_container_remaining_uploads/custom_container_remaining_uploads.dart';
import 'package:duaya_app/features/services/my_ads/widgets/custom_container_upgrade_package/custom_container_upgrade_package.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';

class MyAdsScreen extends StatelessWidget {
  const MyAdsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        title: Text(S.current.myStagnantCategories),
        centerTitle: true,
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.spaceBtwItems),
          child: Column(
            children: [
              /// Container Remaining Uploads
              // const CustomContainerRemainingUploads(),

              /// Make Size
              SizedBox(height: AppSizes.spaceBtwItems / 1.2),

              /// Container Upgrade Package
              // const CustomContainerUpgradePackage(),

              /// Make Size
              SizedBox(height: AppSizes.spaceBtwItems / 1.2),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () =>
                        context.pushNamed(DRoutesName.addNewProductOrAdsRoute),
                    child: Text(S.current.addProduct)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
