// import 'package:duaya_app/common/widgets/appbar/appbar.dart';
// import 'package:flutter/material.dart';
// import 'package:async/async.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import '../../../generated/l10n.dart';
// import '../../../utils/constants/api_constants.dart';
// import 'call.dart';
// import 'dart:developer';
//
// class index extends StatefulWidget {
//   index({super.key});
//
//   @override
//   State<index> createState() => _indexState();
// }
//
// class _indexState extends State<index> {
//   ClientRoleType? _role = ClientRoleType.clientRoleBroadcaster;
//   TextEditingController ChannelController = TextEditingController();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     ChannelController.clear();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: DAppBar(
//         title: Text("S.current.appName"),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           color: Colors.yellowAccent,
//           padding: EdgeInsets.all(10.sp),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 40.h,
//               ),
//               TextField(
//                 controller: ChannelController,
//                 decoration: InputDecoration(
//                     hintText: 'channel name',
//                     border:
//                         UnderlineInputBorder(borderSide: BorderSide(width: 1))),
//               ),
//               RadioListTile(
//                   title: Text("Audience"),
//                   value: ClientRoleType.clientRoleAudience,
//                   groupValue: _role,
//                   onChanged: (ClientRoleType? value) {
//                     _role = value;
//                     setState(() {});
//                   }),
//               RadioListTile(
//                   title: Text("brodcuster"),
//                   value: ClientRoleType.clientRoleBroadcaster,
//                   groupValue: _role,
//                   onChanged: (ClientRoleType? value) {
//                     _role = value;
//                     setState(() {});
//                   }),
//               InkWell(
//                 child: Text("join"),
//                 onTap: () {
//                   onJoin();
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void onJoin() async {
//     await Permission.camera.request();
//     await Permission.microphone.request();
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => Call(
//                   channelName: ChannelController.text,
//                   role: _role!,
//                 )));
//   }
// }
