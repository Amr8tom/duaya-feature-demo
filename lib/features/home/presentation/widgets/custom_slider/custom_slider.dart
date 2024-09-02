import 'package:duaya_app/common/widgets/cached_image/cached_image.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/device/device_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../utils/constants/api_constants.dart';
import '../../controller/best_seller_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
                    String? sliderImage =
                        bestSellerController.slidersModel.data?[index].photo;
                    String? Link =
                        bestSellerController.slidersModel.data?[index].link;
                    return InkWell(
                      onTap: () async {
                        await launch(Link ?? URL.base);
                      },
                      child: CachedImage(
                        link: sliderImage ?? '',
                        width: 600.w,
                        fit: BoxFit.cover,
                        lottieFileOnError: AssetRes.loadingSliders,
                      ),
                    );
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
