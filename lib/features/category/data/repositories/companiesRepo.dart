import 'dart:convert';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:duaya_app/features/category/data/dataSource/companyLocalDataSources.dart';
import 'package:duaya_app/features/category/data/dataSource/companyRemoteDataSources.dart';
import 'package:duaya_app/features/category/data/model/BestSellerProductCompanyModel.dart';
import 'package:duaya_app/features/category/data/model/CompaniesByPageModel.dart';
import 'package:duaya_app/features/category/data/model/NewProductCompanyModel.dart';
import '../../../../utils/connection/checkNetwork.dart';
import '../model/CompanyModel.dart';

class companiesByPageRepoImp {
  companyLocalDataSources localData = companyLocalDataSourcesImp();
  remoteDataSourcesImpForCompany remoteData = remoteDataSourcesImpForCompany();
  companiesByPageRepoImp();
  Future<CompaniesByPageModel> getCompaniesByPage({int page = 0}) async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      print("///////////////  CompaniesByPage Net Connected   ///////////////");
      final Map<String, dynamic>? response =
          await remoteData.getCompanyByPage(page: page);
      localData.cacheCompanyLocalDataSources(jsonBody: jsonEncode(response));
      return CompaniesByPageModel.fromJson(response);
    } else {
      print(
          "///////////////  CompaniesByPage Net Not Connected   ///////////////");
      final jsonCompaniesByPage = await localData.getCompanyLocalDataSources();
      return CompaniesByPageModel.fromJson(jsonCompaniesByPage);
    }
  }

  Future<CompanyModel> getCompanyDetails({required String id}) async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      Map<String, dynamic> response =
          await remoteData.getCompanyDetails(id: id);
      return CompanyModel.fromJson(response);
    } else {
      Map<String, dynamic> response = await localData.getCompanyDetails(id: id);
      return CompanyModel.fromJson(response);
    }
  }

  Future<NewProductCompanyModel> getNewProductCompany(
      {required String id}) async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      Map<String, dynamic>? response =
          await remoteData.getNewProductCompanyByID(id: id);
      return NewProductCompanyModel.fromJson(response);
    } else {
      Map<String, dynamic> response =
          await localData.getNewProductCompany(id: id);
      return NewProductCompanyModel.fromJson(response);
    }
  }

  Future<BestSellerProductCompanyModel> getBestSellerProductCompany(
      {required String id}) async {
    bool networkInfo =
        await NetworkInfoImpl(DataConnectionChecker()).isConnected;
    if (networkInfo) {
      Map<String, dynamic>? response =
          await remoteData.getBestSellerProductCompanyByID(id: id);
      return BestSellerProductCompanyModel.fromJson(response);
    } else {
      Map<String, dynamic> response =
          await localData.getBestSellerProductCompany(id: id);
      return BestSellerProductCompanyModel.fromJson(response);
    }
  }
}
