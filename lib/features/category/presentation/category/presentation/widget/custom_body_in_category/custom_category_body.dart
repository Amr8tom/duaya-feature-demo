import 'package:duaya_app/features/category/presentation/category/presentation/controller/categories_by_page_cubit.dart';
import 'package:duaya_app/features/home/presentation/widgets/custom_category/custom_category.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categpriesController = context.read<CategoriesByPageCubit>();
    return BlocConsumer<CategoriesByPageCubit, CategoriesByPageState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CategoriesByPageInitial) {
          return Center(
            child: Lottie.asset(AssetRes.circleLoading),
          );
        } else {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 20.h),
            shrinkWrap: true,
            itemCount: categpriesController.categoriesModel.data!.length,
            itemBuilder: (context, index) {
              return CustomCategoryInHome(
                  categoryImage:
                      categpriesController.categoriesModel.data![index].icon!,
                  categoryName:
                      categpriesController.categoriesModel.data![index].name!,
                  categoryID: categpriesController
                      .categoriesModel.data![index].id!
                      .toString());
            },
          );
        }
      },
    );
  }
}
