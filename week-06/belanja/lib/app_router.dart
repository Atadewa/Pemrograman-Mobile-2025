import 'package:go_router/go_router.dart';
import 'package:belanja/pages/home_page.dart';
import 'package:belanja/pages/item_page.dart';
import 'package:belanja/models/item.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomePage()),
    GoRoute(
      path: '/item/:name',
      builder: (context, state) {
        final Item item = state.extra as Item;
        return ItemPage(item: item);
      },
    ),
  ],
);
