import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linkwave/common/widgets/loader.dart';
import 'package:linkwave/config/agora_config.dart';
import 'package:linkwave/features/call/controller/call_controller.dart';
import 'package:linkwave/models/call.dart';

class CallScreen extends ConsumerStatefulWidget {
  final String channelId;
  final Call call;
  final bool isGroupChat;
  const CallScreen({
    Key? key,
    required this.channelId,
    required this.call,
    required this.isGroupChat,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CallScreenState();
}

class _CallScreenState extends ConsumerState<CallScreen> {
  AgoraClient? client;
  String baseUrl =
      "007eJxTYCiemh644Gv4BLHUxPs34+IuzRFmCNloeunVoVlXHt8O3tqgwJCcZJliZpxsbJGSaGaSbGFgYZRkYWRgamJqkGSWlJJieWOVc3pDICODqogiEyMDBIL4HAw+mXnZ4YllqQwMAEs+IdU=";

  @override
  void initState() {
    super.initState();
    client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: AgoraConfig.appId,
        channelName: "LinkWave",
        tempToken:
            "007eJxTYCiemh644Gv4BLHUxPs34+IuzRFmCNloeunVoVlXHt8O3tqgwJCcZJliZpxsbJGSaGaSbGFgYZRkYWRgamJqkGSWlJJieWOVc3pDICODqogiEyMDBIL4HAw+mXnZ4YllqQwMAEs+IdU=",
      ),
    );
    initAgora();
  }

  void initAgora() async {
    await client!.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: client == null
          ? const Loader()
          : SafeArea(
              child: Stack(
                children: [
                  AgoraVideoViewer(client: client!),
                  AgoraVideoButtons(
                    client: client!,
                    disconnectButtonChild: IconButton(
                      onPressed: () async {
                        await client!.engine.leaveChannel();
                        ref.read(callControllerProvider).endCall(
                              widget.call.callerId,
                              widget.call.receiverId,
                              context,
                            );
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.call_end),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
