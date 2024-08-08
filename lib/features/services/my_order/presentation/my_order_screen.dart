import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/services/my_order/presentation/widgets/current_order_list.dart';
import 'package:duaya_app/features/services/my_order/presentation/widgets/previous_order_list.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/custom_container/custom_order_contanier.dart';
import '../../../../../generated/l10n.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        title: Text(S.current.myOrder),
        centerTitle: true,
        showBackArrow: true,
      ),
      body: Column(
        children: [
          TabBar(
            indicatorColor: ColorRes.greenBlue,
            controller: _tabController,
            labelColor: ColorRes.black,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(text: S.current.currentRequest),
              Tab(text: S.current.previousRequest),
            ],
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.all(AppSizes.spaceBtwItems),
              child: TabBarView(
                controller: _tabController,
                children: [
                  /// Current Order List
                  const CurrentOrderList(),

                  /// previous order list
                  const PreviousOrderList()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
