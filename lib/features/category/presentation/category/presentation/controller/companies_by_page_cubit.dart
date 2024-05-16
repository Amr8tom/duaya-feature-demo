import 'package:bloc/bloc.dart';
import 'package:duaya_app/features/category/data/model/CompaniesByPageModel.dart';
import 'package:duaya_app/features/category/data/model/NewProductCompanyModel.dart';
import 'package:meta/meta.dart';

import '../../../../data/model/BestSellerProductCompanyModel.dart';
import '../../../../data/model/CompanyModel.dart';
import '../../../../data/repositories/companiesRepo.dart';

part 'companies_by_page_state.dart';

class CompaniesByPageCubit extends Cubit<CompaniesByPageState> {
  CompaniesByPageCubit() : super(CompaniesByPageInitial());
  late CompaniesByPageModel companiesModel = CompaniesByPageModel();
  late CompanyModel companyModel = CompanyModel();
  late BestSellerProductCompanyModel bestSellerCompanyModel =
      BestSellerProductCompanyModel();
  late NewProductCompanyModel newCompanyModel = NewProductCompanyModel();
  companiesByPageRepoImp repo = companiesByPageRepoImp();

  Future<void> fetchCompaniesByPageRepositories() async {
    print("///////////////// Cubit companiesByPage ///////////////////");
    companiesModel = await repo.getCompaniesByPage();
    emit(CompaniesByPageSuccess());
  }

  Future<void> fetchCompanyData({required String id}) async {
    emit(FetchCompanyDataLoading());
    companyModel = await repo.getCompanyDetails(id: id);
    bestSellerCompanyModel = await repo.getBestSellerProductCompany(id: id);
    newCompanyModel = await repo.getNewProductCompany(id: id);
    emit(FetchCompanyDataSuccess());

    print("///////////////// Cubit companyDetailsModel ///////////////////");
  }
}
