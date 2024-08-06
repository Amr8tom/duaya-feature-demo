import 'package:dartz/dartz.dart';
import 'package:duaya_app/utils/connection/checkNetwork.dart';
import '../../../../../../utils/error/failure.dart';
import '../../domain/repositories/repositories.dart';
import '../dataSources/local_data_sources.dart';
import '../dataSources/remote_data_sources.dart';
import '../model/all_orders_model.dart';

class OrdersRepoImp implements OrdersRepo {
  final OrderLocalDataSource localDataSource;
  final OrderRemoteDataSources remoteDataSource;
  final NetworkInfo networkInfo;
  OrdersRepoImp(
      {required this.localDataSource,
      required this.remoteDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, AllOrdersModel>> GetAllOrders() async {
    if (await networkInfo.isConnected) {
      try {
        final orders = await remoteDataSource.getAllOrders();
        localDataSource.cacheOrders(orders: orders);
        return Right(orders);
      } on ServerFailure {
        return left(ServerFailure(
            message:
                '======== serever Faluire is working=========================='));
      }
    } else {
      try {
        final orders = await localDataSource.getOrders();
        return right(orders);
      } on CacheFailure {
        return Left(CacheFailure());
      }
    }
  }
}
