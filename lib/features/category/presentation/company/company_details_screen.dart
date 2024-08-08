import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/category/presentation/category/presentation/controller/companies_by_page_cubit.dart';
import 'package:duaya_app/features/category/presentation/category/presentation/widget/flash_today_deals_body_girdview.dart';
import 'package:duaya_app/features/category/presentation/company/widget/beastSellerGridView.dart';
import 'package:duaya_app/features/flash/presentation/controller/flash_cubit.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
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
    String? logo;
    Widget FlashToday = SizedBox();
    return BlocConsumer<CompaniesByPageCubit, CompaniesByPageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is FetchCompanyDataSuccess) {
          email = companyDetailsController.companyModel.data!.email!;
          phone = companyDetailsController.companyModel.data!.phone!;
          logo = companyDetailsController.companyModel.data?.logo;
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
            title: Text(
              map['title'],
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
              maxLines: 2,
            ),
            centerTitle: true,
            showBackArrow: true,
            actions: [
              IconButton(
                icon: Padding(
                  padding: EdgeInsets.only(left: 15.0.w, top: 5.h),
                  child: Icon(
                    Icons.search,
                    size: 40.w,
                    color: ColorRes.black,
                  ),
                ),
                onPressed: () async {
                  context.pushNamed(DRoutesName.searchRoute,

                      /// pass company ID and name to search screen
                      arguments: {'ID': map['id'], 'name': map['title']});
                },
              ),
            ],
          ),
          body: DefaultTabController(
            length: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// company details
                Container(
                  width: double.infinity,
                  color: ColorRes.greenBlueLight,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 55,
                        child: CachedImage(
                          link: map['logo'] ?? logo,
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
                                .copyWith(
                                    color: ColorRes.greenBlue, fontSize: 14.sp),
                          ),
                          Text(
                            S.current.bestOffers,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    color: ColorRes.greenBlue, fontSize: 14.sp),
                          ),
                          Text(
                            S.current.flashTodaySale,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    color: ColorRes.greenBlue, fontSize: 14.sp),
                          ), // First Tab
                        ],
                        indicatorWeight: 2,
                        indicatorColor: ColorRes.greenBlue,
                      ),
                    ],
                  ),
                ),
                state is FetchCompanyDataSuccess
                    ? Expanded(
                        child: TabBarView(
                        children: [
                          newProductGridView(
                            companyDetailsController: companyDetailsController,
                          ),
                          bestSellerGridView(
                              companyDetailsController:
                                  companyDetailsController),
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
