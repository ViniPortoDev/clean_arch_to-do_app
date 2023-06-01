enum ChatIcons { inbox, allIbox, bookmark }

class ChatFilterEntity {
  final ChatIcons chatIcons;
  final String textTypeChat;
  final String numberMessage;
  final bool isSelected;
  const ChatFilterEntity({
    required this.chatIcons,
    required this.textTypeChat,
    required this.numberMessage,
    this.isSelected = false,
  });


}
