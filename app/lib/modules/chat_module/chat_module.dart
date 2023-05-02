
import 'package:app/utils/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'chat_page_mobile.dart';

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
