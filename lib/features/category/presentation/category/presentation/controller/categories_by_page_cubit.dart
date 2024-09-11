import 'package:bloc/bloc.dart';
import 'package:duaya_app/features/category/data/model/CategoriesByPage.dart';
import 'package:duaya_app/features/category/data/model/SingleCategoryModel.dart';
import 'package:duaya_app/features/category/data/model/sub_category_model.dart';
import 'package:duaya_app/features/category/data/repositories/categoriesRepo.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../../../common/custom_ui.dart';

part 'categories_by_page_state.dart';

class CategoriesByPageCubit extends Cubit<CategoriesByPageState> {
  CategoriesByPageCubit() : super(CategoriesByPageInitial());
  CategoriesByPage categoriesModel = CategoriesByPage();
  SubCategoryModel subCategoriesModel = SubCategoryModel();
  late SingleCategoryModel singleCata;
  // late SubCategoryModel subCategories;
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

  Future<void> fetchCategoryByID(
      {required String cataID, required BuildContext context}) async {
    emit(CategoryByIDLoading());
    print("////////////////  categoryID        ////////////");
    CustomUI.loader(context: context);
    singleCata = await repo.getCategory(
      categoryID: cataID,
    );
    subCategoriesModel = await repo.getSubCategory(categoryID: cataID);
    Navigator.pop(context);
    emit(CategoryByIDSuccess());
  }
}
