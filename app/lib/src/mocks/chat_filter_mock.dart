import '../models/chat_filter_model.dart';

class ChatFilterMock {
  List<ChatFilterModel> chatFilter = [
    ChatFilterModel(
      chatIcons: ChatIcons.allIbox,
      textTypeChat: 'All',
      numberMessage: '35',
      isSelected: true,
    ),
    ChatFilterModel(
      chatIcons: ChatIcons.inbox,
      textTypeChat: 'Live Chat',
      numberMessage: '2',
      isSelected: false,
    ),
    ChatFilterModel(
      chatIcons: ChatIcons.bookmark,
      textTypeChat: 'Live Chat',
      numberMessage: '6',
      isSelected: false,
    ),
  ];
}
