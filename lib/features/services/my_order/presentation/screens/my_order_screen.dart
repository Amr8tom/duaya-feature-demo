import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/services/my_order/domain/usecases/get_order_items_usecase.dart';
import 'package:duaya_app/features/services/my_order/domain/usecases/get_order_items_usecase.dart';
import 'package:duaya_app/features/services/my_order/presentation/widgets/order_list/current_order_list.dart';
import 'package:duaya_app/features/services/my_order/presentation/widgets/order_list/previous_order_list.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/dio/dio_helper.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/widgets/custom_container/custom_order_contanier.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../utils/connection/checkNetwork.dart';
import '../../data/dataSources/local_data_sources.dart';
import '../../data/dataSources/remote_data_sources.dart';
import '../../data/repostories/repositories.dart';
import '../../domain/repositories/repositories.dart';
import '../../domain/usecases/get_all_orders_usercase.dart';
import '../controller/my_orders_controller/my_orders_cubit.dart';
import '../controller/order_items_controller/orer_items_cubit.dart';

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
    final DataConnectionChecker connectionChecker = DataConnectionChecker();
    final dio = DioHelper();
    final OrderLocalDataSource localDataSource = OrderLocalDataSourceImp();
    final OrderRemoteDataSources remoteDataSource =
        OrderRemoteDataSourcesImp(dio);
    final NetworkInfo networkInfo = NetworkInfoImpl(connectionChecker);
    OrdersRepo repo = OrdersRepoImp(
        localDataSource: localDataSource,
        remoteDataSource: remoteDataSource,
        networkInfo: networkInfo);
    GetAllOrdersUseCase useCase = GetAllOrdersUseCase(repo);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MyOrdersCubit(useCase),
        ),
      ],
      child: Scaffold(
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
            Builder(builder: (context) {
              final myOrderController = context.read<MyOrdersCubit>();
              myOrderController.fetchAllOrders();
              return Flexible(
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
              );
            }),
          ],
        ),
      ),
    );
  }
}
