import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

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

       IconData getIcon(ChatFilterModel chatIcons) {
    switch (chatIcons.chatIcons) {
      case ChatIcons.allIbox:
        return LineIcons.comments;

      case ChatIcons.inbox:
        return Icons.inbox;

      case ChatIcons.bookmark:
        return Icons.bookmark_border;
    }
  }
}
