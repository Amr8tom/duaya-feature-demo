import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/category/presentation/category/presentation/controller/companies_by_page_cubit.dart';
import 'package:duaya_app/features/category/presentation/category/presentation/widget/flash_today_deals_body_girdview.dart';
import 'package:duaya_app/features/category/presentation/company/widget/beastSellerGridView.dart';
import 'package:duaya_app/features/flash/presentation/controller/flash_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../common/widgets/cached_image/cached_image.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/constants/image_strings.dart';
import 'widget/newProductGridView.dart';

class CompanyDetailsScreen extends StatelessWidget {
  CompanyDetailsScreen({super.key, required this.map});
  final Map map;
  @override
  Widget build(BuildContext context) {
    final companyDetailsController = context.read<CompaniesByPageCubit>();
    String email = S.current.loading;
    String phone = S.current.loading;
    String adress = S.current.loading;
    String name = S.current.loading;
    String products = S.current.loading;
    String verified = S.current.loading;
    Widget FlashToday = SizedBox();
    return BlocConsumer<CompaniesByPageCubit, CompaniesByPageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is FetchCompanyDataSuccess) {
          email = companyDetailsController.companyModel.data!.email!;
          phone = companyDetailsController.companyModel.data!.phone!;
          adress = companyDetailsController.companyModel.data!.address!;
          name = companyDetailsController.companyModel.data!.name!;
          String reName = companyDetailsController.companyModel.data!.name!;
          context.read<FlashCubit>()
            ..fetchCertainCompanyFlashTodayData(companyName: reName);
          verified = companyDetailsController.companyModel.data!.verifyText!;
          FlashToday = FlashTodayProductGridView(
            companyname: reName,
          );
          products =
              companyDetailsController.companyModel.data!.products.toString()!;
        }
        return Scaffold(
          appBar: DAppBar(
            title: Container(
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90), color: Colors.black),
              child: Text(map['title'],
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.green)),
            ),
            centerTitle: true,
            showBackArrow: true,
            // leadingWidget: const Icon(Icons.arrow_back_ios),
          ),
          body: DefaultTabController(
            length: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CachedImage(
                    link: map['logo'],
                    height: 150.sp,
                  ),
                ),
                SizedBox(height: 10.sp),
                TabBar(
                  tabs: [
                    Text(
                      S.current.newProduct,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: Colors.green),
                    ),
                    Text(
                      S.current.bestOffers,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: Colors.green, fontSize: 17.sp),
                    ),
                    Text(
                      S.current.flashTodaySale,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: Colors.green, fontSize: 16.sp),
                    ), // First Tab
                  ],
                  indicatorWeight: 2,
                  indicatorColor: Colors.black,
                ),
                state is FetchCompanyDataSuccess
                    ? Expanded(
                        child: TabBarView(
                        children: [
                          bestSellerGridView(
                              companyDetailsController:
                                  companyDetailsController),
                          newProductGridView(
                            companyDetailsController: companyDetailsController,
                          ),
                          FlashToday,
                        ],
                      ))
                    : Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 180.sp,
                            ),
                            SizedBox(
                              height: 20.sp,
                            ),
                            Lottie.asset(
                              height: 130.sp,
                              AssetRes.loadingSliders,
                            )
                          ],
                        ),
                      )
              ],
            ),
          ),
        );
      },
    );
  }
}
