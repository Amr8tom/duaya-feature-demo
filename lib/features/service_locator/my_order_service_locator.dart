import 'package:get_it/get_it.dart';

import '../../utils/connection/checkNetwork.dart';
import '../services/my_order/data/dataSources/local_data_sources.dart';
import '../services/my_order/data/dataSources/remote_data_sources.dart';
import '../services/my_order/data/repostories/repositories.dart';
import '../services/my_order/domain/repositories/repositories.dart';
import '../services/my_order/domain/usecases/get_all_orders_usercase.dart';
import '../services/my_order/domain/usecases/get_all_refund_order_usecase.dart';
import '../services/my_order/domain/usecases/get_order_details_usecase.dart';
import '../services/my_order/domain/usecases/send_all_refund_usecase.dart';
import '../services/my_order/presentation/controller/my_orders_controller/my_orders_cubit.dart';
import '../services/my_order/presentation/controller/order_details_controller/order_details_cubit.dart';
import '../services/my_order/presentation/controller/order_refund_controller/order_refund_controller_cubit.dart';

class MyOrderServiceLocator {
  static Future<void> execute({required GetIt serviceLocator}) async {
    serviceLocator.registerLazySingleton<OrderLocalDataSource>(
        () => OrderLocalDataSourceImp());
    serviceLocator.registerLazySingleton<OrderRemoteDataSources>(
        () => OrderRemoteDataSourcesImp(serviceLocator()));

    serviceLocator.registerLazySingleton<OrdersRepo>(() => OrdersRepoImp(
          localDataSource: serviceLocator(),
          remoteDataSource: serviceLocator(),
          networkInfo: serviceLocator<NetworkInfo>(),
        ));
    serviceLocator.registerLazySingleton<SendAllRefundUsecase>(
        () => SendAllRefundUsecase(serviceLocator()));
    serviceLocator.registerLazySingleton<GetAllRefundOrderUsecase>(
        () => GetAllRefundOrderUsecase(serviceLocator()));
    serviceLocator.registerFactory<OrderRefundControllerCubit>(
        () => OrderRefundControllerCubit(serviceLocator(), serviceLocator()));
    serviceLocator.registerLazySingleton<GetAllOrdersUseCase>(
        () => GetAllOrdersUseCase(serviceLocator()));
    serviceLocator
        .registerFactory<MyOrdersCubit>(() => MyOrdersCubit(serviceLocator()));

    serviceLocator.registerLazySingleton<GetOrderDetailsUsecase>(
        () => GetOrderDetailsUsecase(serviceLocator()));
    serviceLocator.registerFactory<OrderDetailsCubit>(
        () => OrderDetailsCubit(serviceLocator()));
  }
}
