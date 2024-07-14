import 'package:carousel_slider/carousel_slider.dart';
import 'package:duaya_app/utils/constants/constants.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/device/device_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:duaya_app/utils/connection/checkImageNetwork.dart';
import 'package:lottie/lottie.dart';
import '../../controller/best_seller_cubit.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    BestSellerCubit bestSellerController = context.read<BestSellerCubit>();
    return Container(
      // height: DDeviceUtils.getScreenHeight(context) * .3,
      width: DDeviceUtils.getScreenWidth(context),
      alignment: AlignmentDirectional.center,

      /// Decoration
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          /// Make Space
          SizedBox(height: 20.h),

          /// Banner
          bestSellerController.slidersModel.data!.isNotEmpty
              ? CarouselSlider.builder(
                  itemBuilder: (BuildContext context, int index, int i) {
                    String sliderImage =
                        bestSellerController.slidersModel.data![index].photo!;
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: FutureBuilder(
                            future: checkImageNetwork.checkImageStatus(
                                NetworkImageURL: sliderImage),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Image.network(sliderImage,
                                    width: 400.w, fit: BoxFit.cover);
                              } else {
                                return Lottie.asset(AssetRes.loadingSliders);
                              }
                            }));
                  },
                  itemCount: bestSellerController.slidersModel.data?.length,
                  options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 0.85,
                    aspectRatio: 2.2,
                    enlargeCenterPage: true,
                    // onPageChanged: homeCubit.onPageChangedSlider,
                  ),
                )
              : Lottie.asset(AssetRes.loadingSliders),
        ],
      ),
    );
  }
}
