import 'package:app/src/pages/mobile/chat_page_mobile.dart';
import 'package:app/utils/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChatModule extends Module {
  @override
  final List<Bind> binds = [];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Routes.chatPage,
      child: (context, args) => const ChatPageMobile(),
    ),
  ];
}
