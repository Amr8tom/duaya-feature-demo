import 'package:duaya_app/features/services/my_ads/domain/repositories/my_ads_repository.dart';
import 'package:duaya_app/features/services/my_ads/domain/usecases/get_my_ads_usecase.dart';
import 'package:duaya_app/features/services/my_ads/domain/usecases/get_my_ads_usecase.dart';
import 'package:get_it/get_it.dart';
import '../../utils/connection/checkNetwork.dart';
import '../services/my_ads/data/datasources/local_data_sources.dart';
import '../services/my_ads/data/datasources/remote_data_sources.dart';
import '../services/my_ads/data/repositories/my_ads_repository.dart';
import '../services/my_ads/domain/usecases/add_ads_usecase.dart';
import '../services/my_ads/presentation/controller/add_ads_cubit.dart';
import '../services/my_ads/presentation/controller/my_ads_list_cubit.dart';

class AddMyAdsServicesLocator {
  static Future<void> execute({required GetIt serviceLocator}) async {
    serviceLocator.registerLazySingleton<MyAdsLocalDataSources>(
        () => MyAdsLocalDataSourcesImp());
    serviceLocator.registerLazySingleton<MyAdsRemoteDataSources>(
        () => MyAdsRemoteDataSourcesImp(serviceLocator()));
    serviceLocator
        .registerLazySingleton<MyAdsRepository>(() => MyAdsRepositoryImp(
              local: serviceLocator(),
              remote: serviceLocator(),
              networkInfo: serviceLocator<NetworkInfo>(),
            ));
    serviceLocator.registerLazySingleton<AddAdsUsecase>(
        () => AddAdsUsecase(serviceLocator()));
    serviceLocator.registerFactory<AddAdsCubit>(
        () => AddAdsCubit(usecase: serviceLocator()));
    serviceLocator.registerLazySingleton<GetMyAdsUsecase>(
        () => GetMyAdsUsecase(serviceLocator()));
    serviceLocator.registerFactory<MyAdsListCubit>(
        () => MyAdsListCubit(usecase: serviceLocator()));
  }
}
