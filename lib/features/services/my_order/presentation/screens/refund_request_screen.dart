import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/services/my_order/presentation/widgets/refund_list/refund_request_list.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/connection/checkNetwork.dart';
import '../../../../../utils/dio/dio_helper.dart';
import '../../data/dataSources/local_data_sources.dart';
import '../../data/dataSources/remote_data_sources.dart';
import '../../data/repostories/repositories.dart';
import '../../domain/repositories/repositories.dart';
import '../../domain/usecases/get_all_refund_order_usecase.dart';
import '../../domain/usecases/send_all_refund_usecase.dart';
import '../controller/order_refund_controller/order_refund_controller_cubit.dart';

class ReturnRequestScreen extends StatelessWidget {
  ReturnRequestScreen({Key? key}) : super(key: key);

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
    SendAllRefundUsecase useCase = SendAllRefundUsecase(repo);
    GetAllRefundOrderUsecase useCase2 = GetAllRefundOrderUsecase(repo);
    return BlocProvider(
      create: (context) => OrderRefundControllerCubit(useCase, useCase2),
      child: Scaffold(
        appBar: DAppBar(
          title: Text(S.current.refunds),
          centerTitle: true,
          showBackArrow: true,
        ),
        body: const RefundRequestList(),
      ),
    );
  }
}
