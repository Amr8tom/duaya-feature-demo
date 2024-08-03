import 'dart:convert';

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:duaya_app/features/category/data/dataSource/categoryLocalDataSources.dart';
import 'package:duaya_app/features/category/data/dataSource/categoryRemoteDataSources.dart';

import '../../../../utils/connection/checkNetwork.dart';
import '../model/CategoriesByPage.dart';
import '../model/SingleCategoryModel.dart';

class categoriesByPageRepoImp {
  categoriesByPageLocalDataSources localData =
      categoriesByPageLocalDataSourcesImp();
  categoriesByPageRemoteDataSources remoteData =
      categoriesByPageRemoteDataSources();
  categoriesByPageRepoImp();
  Future<CategoriesByPage> getCategoriesByPage({int userID = 0}) async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      print(
          "///////////////  categoriesByPage Net Connected   ///////////////");
      final Map<String, dynamic>? response =
          await remoteData.getCategoriesByPage(userID: userID);
      localData.cacheCategoriesByPAge(
          categoriesByPageJson: jsonEncode(response));
      return CategoriesByPage.fromJson(response);
    } else {
      print(
          "///////////////  categoriesByPage Net Not Connected   ///////////////");
      final jsonCategoriesByPage = await localData.getCategoriesByPAge();
      return CategoriesByPage.fromJson(jsonCategoriesByPage);
    }
  }

  Future<SingleCategoryModel> getCategory({required String categoryID}) async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      print("///////////////  categoryByID Net Connected   ///////////////");
      final Map<String, dynamic>? response =
          await remoteData.getCategoryByID(CategoryID: categoryID);
      localData.cacheCategoryByID(
          categoryByIDJson: jsonEncode(response), categoryID: categoryID);
      return SingleCategoryModel.fromJson(response);
    } else {
      print(
          "///////////////  categoryByID Net Not Connected   ///////////////");
      final json = await localData.getCategoryByID(categoryID: categoryID);
      return SingleCategoryModel.fromJson(json);
    }
  }

  Future<SingleCategoryModel?> getCachedCategory(
      {required String categoryID}) async {
    try {
      print(
          "///////////////  categoryByID Net Not Connected   ///////////////");
      final json = await localData.getCategoryByID(categoryID: categoryID);
      return SingleCategoryModel.fromJson(json);
    } catch (error) {
      print(error);
    }
  }
}
