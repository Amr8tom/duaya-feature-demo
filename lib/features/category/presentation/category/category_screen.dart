import 'package:duaya_app/features/category/presentation/category/presentation/controller/companies_by_page_cubit.dart';
import 'package:duaya_app/features/category/presentation/category/presentation/widget/custom_body_in_category/custom_brand_body.dart';
import 'package:duaya_app/features/category/presentation/category/presentation/widget/custom_body_in_category/custom_category_body.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  bool isPressed = true;
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 1, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompaniesByPageCubit, CompaniesByPageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is CompaniesByPageInitial) {
          return Center(
            child: Lottie.asset(AssetRes.normalLoading),
          );
        } else {
          return Column(
            children: [
              TabBar(
                indicatorColor: ColorRes.primary,
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(text: S.current.categories),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(AppSizes.spaceBtwItems),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Stack(children: [
                        SingleChildScrollView(child: CustomCategoryBody())
                      ]),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
