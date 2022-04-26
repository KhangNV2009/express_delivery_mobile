import 'package:flutter/material.dart';

import '../../../data/models/chat/chat_model.dart';
import '../chat_media.dart';
import '../chat_text.dart';
import 'current_user_chat_container.dart';

class CurrentUserChat extends StatelessWidget {
  final GlobalKey _key = GlobalKey();
  final ChatModel chatModel;
  final Function(GlobalKey) onLongPress;

  CurrentUserChat({
    Key? key,
    required this.chatModel,
    required this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurrentUserChatContainer(
      key: _key,
      child: _buildChat(),
      onLongPress: () => chatModel.text != null ? onLongPress(_key) : null,
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
