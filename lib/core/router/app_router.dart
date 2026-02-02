import 'package:auto_route/auto_route.dart';
import 'package:prompt_lib/features/library/presentation/screens/library_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LibraryRoute.page, initial: true, path: '/library'),
  ];
}
