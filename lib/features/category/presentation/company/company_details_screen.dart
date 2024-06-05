import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/category/presentation/category/presentation/controller/companies_by_page_cubit.dart';
import 'package:duaya_app/features/category/presentation/category/presentation/widget/beastSellerGridView.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../../generated/l10n.dart';
import 'package:duaya_app/utils/connection/checkImageNetwork.dart';
import '../../../../../utils/constants/image_strings.dart';
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
    return FutureBuilder(
        future:
            checkImageNetwork.checkImageStatus(NetworkImageURL: map['logo']),
        builder: (context, snapshot) {
          Widget imageWidget;
          if (snapshot.connectionState == ConnectionState.waiting) {
            imageWidget = Center(
              child: Lottie.asset(AssetRes.circleLoading),
            );
          } else if (snapshot.hasError || !snapshot.data!) {
            // Image loading failed, display fallback asset image
            imageWidget = Lottie.asset(AssetRes.emptyProduct2);
          } else {
            // Image loaded successfully, display network image
            imageWidget = Image.network(
              map['logo'],
            );
          }
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
                verified =
                    companyDetailsController.companyModel.data!.verifyText!;
                products = companyDetailsController.companyModel.data!.products
                    .toString()!;
              }
              return Scaffold(
                appBar: DAppBar(
                  title: Text(map['title'],
                      style: Theme.of(context).textTheme.titleLarge),
                  centerTitle: true,
                  showBackArrow: true,
                  // leadingWidget: const Icon(Icons.arrow_back_ios),
                ),
                body: DefaultTabController(
                  length: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                child: imageWidget,
                                height: 150,
                              ),
                              Padding(
                                padding: EdgeInsets.all(2),
                                child: Column(
                                  children: [
                                    Text(adress),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Column(
                                            children: [
                                              Text(S.current.eMail,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelSmall!
                                                      .copyWith(
                                                          color:
                                                              ColorRes.black)),
                                              Text(email,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelSmall!
                                                      .copyWith(
                                                          color:
                                                              ColorRes.black)),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: VerticalDivider(
                                            width: 1.w,
                                            thickness: 1,
                                            color: Colors.black.withOpacity(.2),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Column(
                                            children: [
                                              Text(S.current.callUs,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelSmall!
                                                      .copyWith(
                                                          color:
                                                              ColorRes.black)),
                                              Text(phone,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelSmall!
                                                      .copyWith(
                                                          color:
                                                              ColorRes.black)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      TabBar(
                        tabs: [
                          Tab(text: S.current.newProduct), // First Tab
                          Tab(text: S.current.bestOffers), // Second Tab
                        ],
                      ),
                      state is FetchCompanyDataSuccess
                          ? Expanded(
                              child: TabBarView(
                              children: [
                                bestSellerGridView(
                                    companyDetailsController:
                                        companyDetailsController),
                                newProductGridView(
                                  companyDetailsController:
                                      companyDetailsController,
                                )
                              ],
                            ))
                          : SizedBox()
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
