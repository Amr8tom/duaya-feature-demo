// Offset _fabOffset = Offset(105.w, 95.h); // Initial position of the FAB
// floatingActionButton: Stack(
//   children: [
//     Positioned(
//       left: _fabOffset.dx,
//       top: _fabOffset.dy,
//       child: Draggable<Offset>(
//         data: _fabOffset,
//         feedback: Material(
//           borderRadius: BorderRadius.circular(20.sp),
//           color: ColorRes.lightGreen,
//           child: Lottie.asset(AssetRes.searchICon, height: 60),
//         ),
//         childWhenDragging: Container(),
//         onDraggableCanceled: (velocity, offset) {
//           setState(() {
//             _fabOffset = offset;
//           });
//         },
//         onDragEnd: (details) {
//           setState(() {
//             _fabOffset = details.offset;
//           });
//         },
//         child: RawMaterialButton(
//           onPressed: () {
//             context.pushNamed(DRoutesName.searchRoute);
//           },
//           child: Stack(
//             children: [
//               Lottie.asset(AssetRes.searchICon, height: 105.sp),
//               Positioned(
//                   top: 42,
//                   left: 25,
//                   child: Text(
//                     S.current.search,
//                     style: Theme.of(context)
//                         .textTheme
//                         .headlineMedium,
//                   ))
//             ],
//           ),
//         ),
//       ),
//     ),
//   ],
// ),
