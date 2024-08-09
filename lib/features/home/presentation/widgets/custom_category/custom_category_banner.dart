import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../category/presentation/category/presentation/controller/categories_by_page_cubit.dart';
import 'custom_category.dart';

class CustomCategoryBanner extends StatelessWidget {
  const CustomCategoryBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriesByPageController = context.read<CategoriesByPageCubit>();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          categoriesByPageController.categoriesModel.data!.length,
          (index) => Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 8.0), // Adjust spacing between items
            child: CustomCategoryInHome(
              categoryImage:
                  categoriesByPageController.categoriesModel.data![index].icon!,
              categoryName:
                  categoriesByPageController.categoriesModel.data![index].name!,
              categoryID: categoriesByPageController
                  .categoriesModel.data![index].id!
                  .toString(),
            ),
          ),
        ),
      ),
    );
  }
}
