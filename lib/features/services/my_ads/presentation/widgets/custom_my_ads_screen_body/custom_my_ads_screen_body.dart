import 'package:duaya_app/common/custom_ui.dart';
import 'package:duaya_app/features/services/my_ads/presentation/controller/my_ads_list_cubit.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../routing/routes_name.dart';
import '../../../../../home/presentation/widgets/custom_container_product/custom_container_product.dart';

class CustomMyAdsScreenBody extends StatelessWidget {
  const CustomMyAdsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final myAdsController = context.read<MyAdsListCubit>();
    myAdsController.getMyAdsList();
    return BlocBuilder<MyAdsListCubit, MyAdsListState>(
      builder: (context, state) {
        if (state is MyAdsListLoading) {
          return CustomUI.simpleLoader();
        } else if (state is MyAdsListSuccess) {
          if (state.myAds.data?.length == 0) {
            return CustomUI.noData();
          } else {
            return GridView.builder(
              // physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.h,
                childAspectRatio: 1 / 1.9,
              ),
              // shrinkWrap: true,
              itemCount: state.myAds.data!.length,
              itemBuilder: (context, index) {
                String image = state.myAds.data![index].thumbnailImage!;
                String ID = state.myAds.data![index].id.toString();
                String name = state.myAds.data![index].name ?? "";
                String price = state.myAds.data![index].unitPrice!;
                String shope = state.myAds.data![index].condition ?? "";
                return GestureDetector(
                  onTap: () =>
                      context.pushNamed(DRoutesName.detailsProductRoute),
                  child: CustomContainerProduct(
                      productID: ID,
                      hasDicount: false,
                      productImage: image,
                      productName: name,
                      price: price,
                      companyName: shope,
                      rete: 4.5),
                );
              },
            );
          }
        } else {
          return CustomUI.tryLater();
        }
      },
    );
  }
}
