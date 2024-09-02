import 'package:duaya_app/features/settings/subfeatures/favorites/data/model/check_item_model.dart';
import 'package:duaya_app/features/settings/subfeatures/favorites/data/model/remove_item_model.dart';
import 'package:duaya_app/utils/constants/api_constants.dart';

import '../../../../../../utils/dio/dio_helper.dart';
import '../model/add_item_model.dart';
import '../model/wishlist_model.dart';

abstract class RemoteDataSources {
  Future<WishlistModel> getWishlistModel();
  Future<AddItemModel> addItem({required Map<String, dynamic> params});
  Future<RemoveItemModel> removeItem({required Map<String, dynamic> params});
  Future<CheckItemModel> checkItem({required Map<String, dynamic> params});
}

class RemoteDataSourcesImp implements RemoteDataSources {
  final DioHelper dio;
  RemoteDataSourcesImp(this.dio);
  @override
  Future<AddItemModel> addItem({required Map<String, dynamic> params}) async {
    final response = await dio.getData(URL: URL.whilistAddItem, data: params);
    print("================================================> $response");
    return AddItemModel.fromJson(response);
  }

  @override
  Future<CheckItemModel> checkItem(
      {required Map<String, dynamic> params}) async {
    final response =
        await dio.postData(URL: URL.whilistCheckItem, body: params);
    print("================================================> $response");
    return CheckItemModel.fromJson(response);
  }

  @override
  Future<WishlistModel> getWishlistModel() async {
    final response = await dio.getData(URL: URL.wishlist);
    print("================================================> $response");
    return WishlistModel.fromJson(response);
  }

  @override
  Future<RemoveItemModel> removeItem(
      {required Map<String, dynamic> params}) async {
    final response =
        await dio.postData(URL: URL.whilistRemoveItem, body: params);
    print("================================================> $response");
    return RemoveItemModel.fromJson(response);
  }
}
