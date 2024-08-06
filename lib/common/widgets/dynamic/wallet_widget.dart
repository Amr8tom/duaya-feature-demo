// import 'package:duaya_app/utils/constants/colors.dart';
// import 'package:duaya_app/utils/constants/colors.dart';
// import 'package:duaya_app/utils/constants/colors.dart';
// import 'package:duaya_app/utils/constants/colors.dart';
// import 'package:duaya_app/utils/constants/colors.dart';
// import 'package:flutter/material.dart';
// import 'sizer.dart';
//
// class WalletWidget extends StatelessWidget {
//   final double? margin;
//   final bool details;
//   final Function(BuildContext context)? onBalanceClicked;
//   final Function(BuildContext context)? onWalletClicked;
//   final Function(BuildContext context)? onGiftClicked;
//
//   const WalletWidget(
//       {super.key,
//       this.margin,
//       this.details = false,
//       this.onBalanceClicked,
//       this.onGiftClicked,
//       this.onWalletClicked});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10, horizontal: margin ?? 0),
//       padding: const EdgeInsets.all(5),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: const [
//             BoxShadow(
//               color: ColorRes.greenBlue,
//               blurRadius: 5,
//               spreadRadius: 5,
//             )
//           ]),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const CircleAvatar(
//             radius: 3,
//             backgroundColor: ColorRes.greenBlue,
//           ),
//           const Sizer(),
//           Expanded(
//               child: InkWell(
//             onTap: () {
//               context.push(Routes.WALLET, extra: WalletTypes.balance);
//             },
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Label(
//                     text: 'Balance',
//                     style: Styles.mediumText(
//                         fontWeight: FontWeight.bold, color: Colors.grey)),
//                 Label(
//                     text: '900',
//                     style: Styles.mediumText(
//                         color: ColorRes.greenBlue,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18)),
//               ],
//             ),
//           )),
//           Container(
//             width: .5,
//             margin: const EdgeInsets.symmetric(horizontal: 5),
//             color: Colors.grey,
//             height: kToolbarHeight * .6,
//           ),
//           const CircleAvatar(
//             radius: 3,
//             backgroundColor: ColorRes.greenBlue,
//           ),
//           const Sizer(),
//           Expanded(
//               child: InkWell(
//             onTap: () {
//               context.push(Routes.WALLET, extra: WalletTypes.giftWallet);
//             },
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Label(
//                     text: 'Gift',
//                     style: Styles.mediumText(
//                         fontWeight: FontWeight.bold, color: Colors.grey)),
//                 Label(
//                     text: '300',
//                     style: Styles.mediumText(
//                         color: const Color.fromARGB(255, 87, 87, 87),
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18)),
//               ],
//             ),
//           )),
//           Container(
//             width: .5,
//             margin: const EdgeInsets.symmetric(horizontal: 5),
//             color: Colors.grey,
//             height: kToolbarHeight * .6,
//           ),
//           const CircleAvatar(
//             radius: 3,
//             backgroundColor: ColorRes.greenBlue,
//           ),
//           const Sizer(),
//           Expanded(
//               child: InkWell(
//             onTap: () {
//               context.push(Routes.WALLET, extra: WalletTypes.mainWallet);
//             },
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Label(
//                     text: 'Wallet',
//                     style: Styles.mediumText(
//                         fontWeight: FontWeight.bold, color: Colors.grey)),
//                 Label(
//                     text: '400',
//                     style: Styles.mediumText(
//                         color: const Color.fromARGB(255, 87, 87, 87),
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18)),
//               ],
//             ),
//           )),
//         ],
//       ),
//     );
//   }
// }
