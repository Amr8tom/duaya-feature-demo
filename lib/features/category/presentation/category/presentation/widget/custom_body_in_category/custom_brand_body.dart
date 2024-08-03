import 'package:duaya_app/features/category/presentation/category/presentation/widget/custom_component_for_brand/custom_component_for_brand.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../controller/companies_by_page_cubit.dart';

class CustomBrandBody extends StatelessWidget {
  const CustomBrandBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final companiesController = context.read<CompaniesByPageCubit>();
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1,
        crossAxisCount: 2,
        mainAxisSpacing: 5.h,
      ),
      shrinkWrap: true,
      itemCount: companiesController.companiesModel.data!.length!,
      itemBuilder: (context, index) {
        String title =
            companiesController.companiesModel?.data![index].name ?? "we";
        String logo =
            companiesController.companiesModel?.data![index].logo ?? "sd";
        String id =
            companiesController.companiesModel?.data![index].id.toString() ??
                "";
        return id == ""
            ? SizedBox()
            : CustomComponentForBrand(
                brandImage: logo,
                brandTitle: title,
                onTap: () async {
                  context
                      .pushNamed(DRoutesName.companyDetailsRoute, arguments: {
                    'title': title,
                    'logo': logo,
                    'id': id,
                  });
                  await companiesController.fetchCompanyData(id: id);
                });
      },
    );
  }
}
