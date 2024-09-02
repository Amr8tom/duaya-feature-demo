import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/services/my_order/presentation/controller/order_items_controller/orer_items_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../utils/connection/checkNetwork.dart';
import '../../../../../utils/dio/dio_helper.dart';
import '../../data/dataSources/local_data_sources.dart';
import '../../data/dataSources/remote_data_sources.dart';
import '../../data/repostories/repositories.dart';
import '../../domain/repositories/repositories.dart';
import '../../domain/usecases/get_order_items_usecase.dart';
import '../widgets/order_details/order_details_body.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> args;

  const OrderDetailsScreen({super.key, required this.args});

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
    GetOrderItemsUsecase useCase = GetOrderItemsUsecase(repo);
    return BlocProvider(
      create: (context) => OrerItemsCubit(useCase),
      child: Builder(builder: (context) {
        final itemsController = context.read<OrerItemsCubit>();
        itemsController.fetchOrderItems(orderID: args["orderID"]);
        return Scaffold(
          appBar: DAppBar(
            showBackArrow: true,
            title: Text(S.current.orderDetails),
          ),
          body: OrderDetalisBody(
            args: args,
          ),
        );
      }),
    );
  }
}
