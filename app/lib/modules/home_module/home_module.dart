import 'package:app/src/pages/home_page.dart';
import 'package:app/utils/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Routes.home,
      child: (context, args) => const HomePage(),
    ),
  ];
}
