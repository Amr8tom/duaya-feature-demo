import 'package:dartz/dartz.dart';
import 'package:duaya_app/features/services/customer_ads/data/data_sources/local_data_sources.dart';
import 'package:duaya_app/features/services/customer_ads/domain/repositories/repository.dart';
import 'package:duaya_app/features/services/customer_ads/domain/usecases/get_all_customer_ads_usecase.dart';
import 'package:duaya_app/features/services/customer_ads/domain/usecases/get_customer_ad_details_usecase.dart';
import 'package:duaya_app/features/services/customer_ads/presentation/contoller/customer_ads_cubit.dart';
import 'package:get_it/get_it.dart';

import '../services/customer_ads/data/data_sources/remote_data_sources.dart';
import '../services/customer_ads/data/repositories/repository.dart';

class CustomerAdsServicesLocator {
  static Future<void> execute({required GetIt serviceLocator}) async {
    serviceLocator.registerLazySingleton<CustomerAdsLocalDataSources>(
        () => CustomerAdsLocalDataSourcesImp());
    serviceLocator.registerLazySingleton<CustomerAdsRemoteDataSources>(
        () => CustomerAdsRemoteDataSourcesImp(serviceLocator()));
    serviceLocator.registerLazySingleton<CustomerAdsRepository>(() =>
        CustomerAdsRepositoryImp(
            local: serviceLocator(),
            remote: serviceLocator(),
            networkInfo: serviceLocator()));
    serviceLocator.registerLazySingleton<GetAllCustomerAdsUsecase>(
        () => GetAllCustomerAdsUsecase(serviceLocator()));
    serviceLocator.registerLazySingleton<GetCustomerAdDetailsUsecase>(
        () => GetCustomerAdDetailsUsecase(serviceLocator()));
    serviceLocator.registerFactory<CustomerAdsCubit>(
        () => CustomerAdsCubit(serviceLocator(), serviceLocator()));
  }
}
