import 'dart:convert';

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:duaya_app/features/home/data/dataSource/localDataSource.dart';
import 'package:duaya_app/features/home/data/dataSource/remoteDataSorces.dart';
import 'package:duaya_app/features/home/data/model/bestSellerModel.dart';
import 'package:duaya_app/features/home/data/model/productModel.dart';
import 'package:duaya_app/features/home/data/model/sliderModel.dart';

import '../../../../utils/connection/checkNetwork.dart';
import '../model/RelatedProductModel.dart';

class bestSellerReposoitoryImp {
  bestSellerLocalDataSourceImpl localData = bestSellerLocalDataSourceImpl();
  bestSellerRemoteDataSoureces remoteData = bestSellerRemoteDataSoureces();
  bestSellerReposoitoryImp();

  Future<BestSellerModel> getBestSellerModel() async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      print("//////////// connected  ////////////");
      var response = await remoteData.getBestSellerData();
      localData.cacheBrstSellerJson(bestSellerJson: jsonEncode(response));
      print(response);
      return BestSellerModel.fromJson(response);
    } else {
      print("////////////////  not connected //////////////////");
      var response = await localData.getBestSeller();
      print(response);

      return BestSellerModel.fromJson(response);
    }
  }

  Future<SliderModel> getSlidersModel() async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      print("//////////// connected  ////////////");

      var response = await remoteData.getSliders();
      localData.cacheSlidersJson(SlidersJson: jsonEncode(response));
      print(response);
      return SliderModel.fromJson(response);
    } else {
      print("////////////////  not connected //////////////////");
      var response = await localData.getSliders();
      print(response);

      return SliderModel.fromJson(response);
    }
  }

  Future<ProductModel> getProductModel({required String productID}) async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      print("////////////////  connected   ////////////////////");
      var response = await remoteData.getProductDetails(productID: productID);
      localData.cacheProductDetails(
          productJson: jsonEncode(response), productID: productID);
      print(response);
      return ProductModel.fromJson(response);
    } else {
      print(" /////////////////////// nor connected /////////////////////");
      var response = await localData.getProductJson(productID: productID);
      return ProductModel.fromJson(response);
    }
  }

/////////// id didnt modify the model here
  Future<RelatedProductModel> getRelatedModel(
      {required String productID}) async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      print("////////////////  connected   ////////////////////");
      var response = await remoteData.getRelatedProduct(productID: productID);
      localData.cacheRelatedProduct(
          relatedProductJson: jsonEncode(response), productID: productID);
      print(response);
      return RelatedProductModel.fromJson(response);
    } else {
      print(" /////////////////////// nor connected /////////////////////");
      var response = await localData.getRelatedProduct(productID: productID);
      return RelatedProductModel.fromJson(response);
    }
  }
}
