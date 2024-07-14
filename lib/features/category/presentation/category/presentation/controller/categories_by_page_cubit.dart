import 'package:bloc/bloc.dart';
import 'package:duaya_app/features/category/data/model/CategoriesByPage.dart';
import 'package:duaya_app/features/category/data/model/SingleCategoryModel.dart';
import 'package:duaya_app/features/category/data/repositories/categoriesRepo.dart';
import 'package:meta/meta.dart';

part 'categories_by_page_state.dart';

class CategoriesByPageCubit extends Cubit<CategoriesByPageState> {
  CategoriesByPageCubit() : super(CategoriesByPageInitial());
  CategoriesByPage categoriesModel = CategoriesByPage();
  late SingleCategoryModel singleCata;
  Map<String, dynamic> idsMapForCata = {};
  categoriesByPageRepoImp repo = categoriesByPageRepoImp();

  Future<void> fetchCategoriesByPage({required int userID}) async {
    emit(CategoriesByPageInitial());
    print("///////////////// Cubit categoriesByPage ///////////////////");
    categoriesModel = await repo.getCategoriesByPage(userID: userID);
    getAllCataID();
    print("${idsMapForCata}");
    emit(CategoriesByPageSuccess());
  }

  Future<void> getAllCataID() async {
    emit(CategoriesGetIDsLoading());
    print("///////////////// Cubit categoriesByPage ///////////////////");
    categoriesModel.data!.length > 0
        ? categoriesModel.data!.forEach((element) {
            idsMapForCata[element.name!] = element.id!;
          })
        : () {};
    emit(CategoriesGetIDsSuccess());
  }

  Future<void> fetchCategoryByID({required String cataID}) async {
    print("////////////////  categoryID        ////////////");
    singleCata = await repo.getCategory(
      categoryID: cataID,
    );
    emit(CategoryByIDSuccess());
  }
}
