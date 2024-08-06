import 'dart:async';
import 'dart:convert';

import '../../../../../../utils/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../../../utils/local_storage/cach_keys.dart';
import '../../../../../../utils/local_storage/cache_helper.dart';
import '../model/all_orders_model.dart';

abstract class OrderLocalDataSource {
  Future<Unit> cacheOrders({required AllOrdersModel orders});
  Future<AllOrdersModel> getOrders();
}

class OrderLocalDataSourceImp implements OrderLocalDataSource {
  @override
  Future<Unit> cacheOrders({required AllOrdersModel orders}) async {
    final String cachedOrders = jsonEncode(orders);
    await PrefService.putString(key: CacheKeys.orders, value: cachedOrders);
    return Future.value(unit);
  }

  @override
  Future<AllOrdersModel> getOrders() async {
    final jsonString = PrefService.getString(key: CacheKeys.orders);
    if (jsonString != null) {
      AllOrdersModel decodedJson = json.decode(jsonString);
      return Future.value(decodedJson);
    } else {
      throw CacheFailure();
    }
  }
}
