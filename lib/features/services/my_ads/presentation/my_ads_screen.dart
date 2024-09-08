import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/services/my_ads/presentation/widgets/custom_add_ads_button/custom_add_ads_button.dart';
import 'package:duaya_app/features/services/my_ads/presentation/widgets/custom_my_ads_screen_body/custom_my_ads_screen_body.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../service_locator/serrvice_locator.dart';
import 'controller/my_ads_list_cubit.dart';

class MyAdsScreen extends StatelessWidget {
  const MyAdsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<MyAdsListCubit>(),
      child: Scaffold(
        appBar: DAppBar(
          title: Text(S.current.myStagnantCategories),
          centerTitle: true,
          showBackArrow: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(AppSizes.spaceBtwItems),
          child: Stack(
            children: [
              const CustomMyAdsScreenBody(),
              // const CustomAddAdsButton(),
            ],
          ),
        ),
        bottomNavigationBar: CustomAddAdsButton(),
      ),
    );
  }
}
