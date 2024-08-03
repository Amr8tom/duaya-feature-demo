import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/category/presentation/category/presentation/controller/companies_by_page_cubit.dart';
import 'package:duaya_app/features/category/presentation/category/presentation/widget/custom_body_in_category/custom_category_body.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../generated/l10n.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);

  bool isPressed = true;

  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompaniesByPageCubit, CompaniesByPageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is CompaniesByPageInitial) {
          return Center(
            child: Lottie.asset(AssetRes.animationLoading),
          );
        } else {
          return Scaffold(
            appBar: DAppBar(
              showBackArrow: true,
              title: Text(
                S.current.categories,
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                SizedBox(height: 20.sp),
                // Text(
                //   S.current.categories,
                //   style: Theme.of(context).textTheme.headlineMedium,
                // ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(AppSizes.spaceBtwItems),
                    child: SingleChildScrollView(child: CategoryBody()),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
