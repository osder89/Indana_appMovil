import 'package:go_router/go_router.dart';
import 'package:indana_app/presentacion/view/maps/home_maps_screen.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: HomeMapsScreen.name,
    builder: (context, state) => HomeMapsScreen(),
  ),
]);
