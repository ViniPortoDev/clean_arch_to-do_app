enum ChatIcons { inbox, allIbox, bookmark }

class ChatFilterModel {
  final ChatIcons chatIcons;
  final String textTypeChat;
  final String numberMessage;
  final bool isSelected;
  const ChatFilterModel({
    required this.chatIcons,
    required this.textTypeChat,
    required this.numberMessage,
    this.isSelected = false,
  });
}
