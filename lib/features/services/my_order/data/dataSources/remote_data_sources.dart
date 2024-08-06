import 'package:duaya_app/utils/constants/api_constants.dart';

import '../../../../../../utils/dio/dio_helper.dart';
import '../model/all_orders_model.dart';

abstract class OrderRemoteDataSources {
  Future<AllOrdersModel> getAllOrders();
}

class OrderRemoteDataSourcesImp implements OrderRemoteDataSources {
  final DioHelper dio;
  OrderRemoteDataSourcesImp(this.dio);
  @override
  Future<AllOrdersModel> getAllOrders() async {
    final response = await dio.getData(URL: URL.getAllOrders);
    print("================================================> $response");
    return AllOrdersModel.fromJson(response);
  }
}
