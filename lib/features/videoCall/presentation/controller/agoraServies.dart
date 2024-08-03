// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
//
// class AgoraService {
//   static const String appId = 'YOUR_APP_ID';
//   // static const String token =
//   //     'YOUR_TEMP_TOKEN'; // Optional if you are using a token
//   // static const String channelName = 'test';
//
//   static final RtcEngine _engine = createAgoraRtcEngine();
//
//   static Future<void> initialize({required ClientRoleType role}) async {
//     await _engine.initialize(RtcEngineContext(appId: appId));
//     await _engine.enableVideo();
//     await _engine.setClientRole(role: role); // Set the client role
//   }
//
//   static Future<void> joinChannel(
//       {required String channelName, required String Token}) async {
//     await _engine.joinChannel(
//       token: Token,
//       channelId: channelName,
//       uid: 0,
//       options: ChannelMediaOptions(),
//     );
//   }
//
//   static Future<void> leaveChannel() async {
//     await _engine.leaveChannel();
//   }
//
//   static Future<void> destroy() async {
//     await _engine.release();
//   }
//
//   static RtcEngine get engine => _engine;
// }
