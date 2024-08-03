import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/services/presentation/my_order/widgets/custom_container_order/custom_container_order.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';

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
    _tabController = TabController(length: 3, vsync: this);
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
            indicatorColor: ColorRes.primary,
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(text: S.current.requested),
              Tab(text: S.current.completed),
              Tab(text: S.current.calnced),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(AppSizes.spaceBtwItems),
              child: TabBarView(
                controller: _tabController,
                children: [
                  // first tab bar view widget
                  Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return SizedBox(height: AppSizes.spaceBtwItems);
                            },
                            itemCount: 12,
                            itemBuilder: (context, index) {
                              return const CustomContainerOrder();
                            }),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(height: AppSizes.spaceBtwItems);
                        },
                        itemCount: 12,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {},
                              child: const CustomContainerOrder());
                        }),
                  ),
                  Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(height: AppSizes.spaceBtwItems);
                        },
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {},
                              child: const CustomContainerOrder());
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
