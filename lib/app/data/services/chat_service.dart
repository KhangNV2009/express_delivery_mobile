import '../../constants/core_remote_constants.dart';
import '../models/chat/chat_response.dart';
import 'core_service.dart';

abstract class IChatService {
  Future<ChatResponse> getChatDetail({
    required int sessionId,
    required int limit,
    required int page,
  });
}

class ChatService extends IChatService {
  CoreService service = CoreService();

  ///Constructors
  static final ChatService _instance = ChatService._internal();

  ChatService._internal();

  factory ChatService() {
    return _instance;
  }

  static const String _chats = 'chats';

  @override
  Future<ChatResponse> getChatDetail({
    required int sessionId,
    required int limit,
    required int page,
  }) async {
    ChatResponse response = ChatResponse();
    final Map<String, dynamic> query = {};
    query['limit'] = limit;
    query['page'] = page;
    await service.performRequest(
      url: '$_chats/$sessionId',
      query: query,
      method: CoreHTTPMethod.get,
      onResponse: (data) {
        response = ChatResponse.fromJson(data);
      },
      onError: (error) {
        response.updateErrorResponse(error);
      },
    );
    return response;
  }
}
