import 'package:app/modules/home_module/domain/entities/chat_filter_entity.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';








class ChatFilterMock {
  List<ChatFilterEntity> chatFilter = [
    const ChatFilterEntity(
      chatIcons: ChatIcons.allIbox,
      textTypeChat: 'All',
      numberMessage: '35',
      isSelected: true,
    ),
    const ChatFilterEntity(
      chatIcons: ChatIcons.inbox,
      textTypeChat: 'Live Chat',
      numberMessage: '2',
    ),
    const ChatFilterEntity(
      chatIcons: ChatIcons.bookmark,
      textTypeChat: 'Live Chat',
      numberMessage: '6',
    ),
  ];

       IconData getIcon(ChatFilterEntity chatIcons) {
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
