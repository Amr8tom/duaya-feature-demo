import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:duaya_app/features/service_locator/my_order_service_locator.dart';
import 'package:duaya_app/utils/dio/dio_helper.dart';
import 'package:get_it/get_it.dart';
import '../../utils/connection/checkNetwork.dart';
import 'add_my_ads_services_locator.dart';
import 'customer_ads_services_locator.dart';
import 'my_favourites_service_locator.dart';

final serviceLocator = GetIt.instance;

class DI {
  static Future<void> execute() async {
    serviceLocator.registerLazySingleton(() => DataConnectionChecker());
    serviceLocator.registerLazySingleton(() => DioHelper());
    serviceLocator.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(serviceLocator()));

    /// My Orders
    await MyOrderServiceLocator.execute(serviceLocator: serviceLocator);

    /// My favourites
    await MyFavouritesServiceLocator.execute(serviceLocator: serviceLocator);

    /// My Add MyAds
    await AddMyAdsServicesLocator.execute(serviceLocator: serviceLocator);

    /// Customer Ads
    await CustomerAdsServicesLocator.execute(serviceLocator: serviceLocator);
  }
}
