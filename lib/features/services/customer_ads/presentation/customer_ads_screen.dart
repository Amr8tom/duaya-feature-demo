import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/service_locator/serrvice_locator.dart';
import 'package:duaya_app/features/services/customer_ads/presentation/contoller/customer_ads_cubit.dart';
import 'package:duaya_app/features/services/customer_ads/presentation/widget/custom_customer_ads_body.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerAdsScreen extends StatelessWidget {
  const CustomerAdsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<CustomerAdsCubit>(),
      child: Scaffold(
        appBar: DAppBar(
          title: Text(S.current.stagnantCategories),
          centerTitle: true,
          showBackArrow: true,
        ),
        body: const CustomCustomerAdsBody(),
      ),
    );
  }
}
