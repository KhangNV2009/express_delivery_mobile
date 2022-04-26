import 'package:express_delivery/app/components/chat/partner_chat/partner_chat_container.dart';
import 'package:flutter/material.dart';

import '../../../constants/core_remote_constants.dart';
import '../../../data/models/chat/chat_model.dart';
import '../chat_media.dart';
import '../chat_text.dart';

class PartnerChat extends StatelessWidget {
  final GlobalKey _key = GlobalKey();
  final ChatModel chatModel;
  final Function(GlobalKey) onLongPress;

  PartnerChat({
    Key? key,
    required this.chatModel,
    required this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String path;
    final avatar = chatModel.user?.avatar;
    if(avatar != null) {
      path = CoreRemoteConstants.baseImageUrl + avatar;
    } else {
      path = 'https://i.pinimg.com/564x/cd/e1/fb/cde1fb3f0cab1d196510aeb6f4c9c3d5.jpg';
    }
    return PartnerChatContainer(
      key: _key,
      name: chatModel.user?.fullName ?? '',
      avatar: path,
      onLongPress: () => chatModel.text != null ? onLongPress(_key) : null,
      child: _buildChat(),
      time: chatModel.createdAt ?? '',
    );
  }

  Widget _buildChat() {
    if (chatModel.text != null) {
      return ChatText(
        message: chatModel.text ?? '',
      );
    }
    if (chatModel.images != null) {
      return ChatMedia(
        mediaPaths: chatModel.images ?? [],
      );
    } else {
      return SizedBox();
    }
  }
}
