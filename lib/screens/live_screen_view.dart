import 'package:flutter/material.dart';
import 'package:live_stream_with_zego_cloud/utils.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

class LiveScreenView extends StatelessWidget {
  final liveId;
  final userId;
  final isHost; //to check weather user is joining the live or Hosting the live stream
  const LiveScreenView({
    super.key,
    this.liveId,
    this.userId,
    this.isHost,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveStreaming(
        appID: Utils.appId,
        appSign: Utils.appSignIn,
        userID: userId,
        userName: "user_$userId",
        liveID: liveId,
        config: isHost
            ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
            : ZegoUIKitPrebuiltLiveStreamingConfig.audience()..audioVideoViewConfig.showAvatarInAudioMode = true..audioVideoViewConfig.showSoundWavesInAudioMode = true,
      ),
    );
  }
}
