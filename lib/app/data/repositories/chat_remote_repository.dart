import 'package:express_delivery/app/data/models/chat/chat_response.dart';

import '../services/chat_service.dart';

class ChatRemoteRepository extends IChatService {
  final ChatService _chatService = ChatService();

  @override
  Future<ChatResponse> getChatDetail({
    required int sessionId,
    required int limit,
    required int page,
  }) {
    return _chatService.getChatDetail(
      sessionId: sessionId,
      limit: limit,
      page: page,
    );
  }
}
