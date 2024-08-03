// // import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';
// import 'dart:async';
// // import 'package:flutter/cupertino.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:flutter/material.dart';
//
// import '../../../utils/constants/api_constants.dart';
//
// class Call extends StatefulWidget {
//   ClientRoleType role;
//   String channelName;
//
//   Call({required this.channelName, required this.role});
//   @override
//   State<Call> createState() => _CallState();
// }
//
// class _CallState extends State<Call> {
//   List<int> users = [];
//   List<String> infoStrings = [];
//   bool viewPanel = false;
//   bool mute = false;
//   final rtcEngine = createAgoraRtcEngine();
//
//   @override
//   void initState() async {
//     // TODO: implement initState
//     super.initState();
//     await initialize();
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     users.clear();
//     infoStrings.clear();
//     rtcEngine.leaveChannel();
//     rtcEngine.createCustomVideoTrack();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text("dsd"),
//     );
//   }
//
//   Future<void> initialize() async {
//     if (URL.agoraID.isEmpty) {
//       infoStrings.add("please insertAgoraID");
//       infoStrings.add("agora engine is not woriking");
//     } else {
//       rtcEngine.initialize(RtcEngineContext(appId: URL.agoraID));
//       VideoEncoderConfiguration videoConfig = VideoEncoderConfiguration(
//           dimensions: VideoDimensions(width: 1920, height: 1080));
//       rtcEngine.joinChannel(
//           token: URL.agoraToken,
//           channelId: widget.channelName!,
//           uid: 0,
//           options: ChannelMediaOptions());
//       rtcEngine.enableVideo();
//       rtcEngine
//           .setChannelProfile(ChannelProfileType.channelProfileLiveBroadcasting);
//       rtcEngine.setClientRole(role: widget.role);
//     }
//   }
//
//   Future<void> agoraEventHandeler() async {
//     rtcEngine.registerEventHandler(
//         RtcEngineEventHandler(onJoinChannelSuccess: (connection, elaped) {
//       print(
//           "onJoinChannelSuccess: ${connection.channelId}, uid: ${connection.localUid}");
//       infoStrings.add(
//           "onJoinChannelSuccess: ${connection.channelId}, uid: ${connection.localUid}");
//     }, onUserJoined: (connection, elpased, elpased2) {
//       users.add(connection.localUid!);
//     }, onUserOffline: (connection, elasped, reasone) {
//       print(
//           "connectoin left reasolne${reasone.name},user id${connection.localUid}");
//     }));
//   }
// }
