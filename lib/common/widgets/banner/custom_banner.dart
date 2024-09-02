// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:duaya_app/utils/constants/constants.dart';
// import 'package:duaya_app/utils/device/device_utility.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../utils/constants/exports.dart';
//
// class CustomBanner extends StatelessWidget {
//   const CustomBanner({super.key, required this.bannerImage});
//
//   final String bannerImage;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: DDeviceUtils.getScreenHeight(context) * .26,
//       width: DDeviceUtils.getScreenWidth(context),
//       alignment: AlignmentDirectional.center,
//       /// Decoration
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12.r),
//       ),
//       child: Column(
//         children: [
//           /// Make Space
//           SizedBox(height: 20.h),
//
//           /// Banner
//           CarouselSlider.builder(
//             itemBuilder: (BuildContext context, int index, int i) {
//               // return CachedImage(
//               //   link: 'assets/images/banner.png',
//               //   width: 400.w,
//               //   borderRadius: 25.r,
//               //   fit: BoxFit.cover,
//               // );
//               // return ClipRRect(borderRadius: BorderRadius.circular(16.r), child: Image.asset(bannerImage, width: 400.w, fit: BoxFit.cover));
//               return ClipRRect(borderRadius: BorderRadius.circular(16.r), child: Image.asset(DConstants.bannersList[index], width: 400.w, fit: BoxFit.cover));
//             },
//             itemCount: DConstants.bannersList.length,
//             options: CarouselOptions(
//               autoPlay: true,
//               aspectRatio: 2.1,
//               enlargeCenterPage: true,
//               // onPageChanged: homeCubit.onPageChangedSlider,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
