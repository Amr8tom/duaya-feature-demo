import 'package:duaya_app/features/flash/presentation/controller/flash_cubit.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../routing/routes_name.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../home/presentation/widgets/custom_container_product/custom_container_product.dart';

class FlashGridView extends StatelessWidget {
  FlashGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final flashController = context.read<FlashCubit>();
    return BlocConsumer<FlashCubit, FlashState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        print(State);
        print(State);
        print(State);
        print(State);
        print(State);
        if (state is FlashInitial) {
          flashController.fetchFlashData();
          return Center(
            child: Lottie.asset(AssetRes.loadingSliders),
          );
        } else if (state is FlashLoadingState) {
          return Center(
            child: Lottie.asset(AssetRes.loadingSliders),
          );
        } else if (state is FlashSuccessState) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.h,
              childAspectRatio: 1 / 2.2,
            ),
            shrinkWrap: true,
            itemCount:
                flashController.flashModel.data![0].products!.data2!.length,
            itemBuilder: (context, index) {
              String image = flashController
                  .flashModel.data![0].products!.data2![index].image!;
              String ID = flashController
                  .flashModel.data![0].products!.data2![index].id
                  .toString()!;
              String name = flashController
                  .flashModel.data![0].products!.data2![index].name!;
              String price = flashController
                  .flashModel.data![0].products!.data2![index].price!;
              String shope = flashController.flashModel.data![0].title!;
              return GestureDetector(
                onTap: () => context.pushNamed(DRoutesName.detailsProductRoute),
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
        } else {
          return SizedBox();
        }
      },
    );
    ;
  }
}
