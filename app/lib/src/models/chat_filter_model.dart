enum ChatIcons { inbox, allIbox, bookmark }

class ChatFilterModel {
  final ChatIcons chatIcons;
  final String textTypeChat;
  final String numberMessage;
  bool isSelected;
  ChatFilterModel({
    required this.chatIcons,
    required this.textTypeChat,
    required this.numberMessage,
    required this.isSelected,
  });
}
