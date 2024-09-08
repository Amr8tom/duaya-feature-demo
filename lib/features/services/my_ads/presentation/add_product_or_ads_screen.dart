import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/services/my_ads/presentation/widgets/custom_add_product_body/custom_add_product_body.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service_locator/serrvice_locator.dart';
import 'controller/add_ads_cubit.dart';

class AddProductOrAdsScreen extends StatelessWidget {
  const AddProductOrAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<AddAdsCubit>(),
      child: Scaffold(
          appBar: DAppBar(
            title: Text(
              S.current.addProduct,
            ),
            centerTitle: true,
            showBackArrow: true,
          ),
          body: const CustomAddProductBody()),
    );
  }
}
