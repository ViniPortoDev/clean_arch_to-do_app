import '../models/chat_filter_model.dart';

class ChatFilterMock {
  List<ChatFilterModel> chatFilter = [
    const ChatFilterModel(
      chatIcons: ChatIcons.allIbox,
      textTypeChat: 'All',
      numberMessage: '35',
      isSelected: true,
    ),
    const ChatFilterModel(
      chatIcons: ChatIcons.inbox,
      textTypeChat: 'Live Chat',
      numberMessage: '2',
    ),
    const ChatFilterModel(
      chatIcons: ChatIcons.bookmark,
      textTypeChat: 'Live Chat',
      numberMessage: '6',
    ),
  ];
}
