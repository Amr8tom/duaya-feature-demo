import 'package:bloc/bloc.dart';
import 'package:duaya_app/features/category/data/model/CategoriesByPage.dart';
import 'package:duaya_app/features/category/data/model/SingleCategoryModel.dart';
import 'package:duaya_app/features/category/data/repositories/categoriesRepo.dart';
import 'package:meta/meta.dart';

part 'categories_by_page_state.dart';

class CategoriesByPageCubit extends Cubit<CategoriesByPageState> {
  CategoriesByPageCubit() : super(CategoriesByPageInitial());
  late CategoriesByPage categoriesModel;
  late SingleCategoryModel singleCata;
  categoriesByPageRepoImp repo = categoriesByPageRepoImp();

  Future<void> fetchCategoriesByPage({required int userID}) async {
    print("///////////////// Cubit categoriesByPage ///////////////////");
    categoriesModel = await repo.getCategoriesByPage(userID: userID);
    emit(CategoriesByPageSuccess());
  }

  Future<void> fetchCategoryByID({required String cataID}) async {
    print("////////////////  categoryID        ////////////");
    singleCata = await repo.getCategory(categoryID: cataID);
    emit(CategoryByIDSuccess());
  }
}
