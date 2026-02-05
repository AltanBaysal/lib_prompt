import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibe_lib/core/init/app_initializer.dart';
import 'package:vibe_lib/core/router/app_router.dart';
import 'package:vibe_lib/core/theme/app_theme.dart';

void main() async {
  await AppInitializer.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // We need to access the router.
    // Since AppRouter is not a provider by default in this simple setup,
    // we can instantiate it here or provide it via Riverpod if needed later.
    // For now, instantiating it is fine as per AutoRoute docs for simple usage.
    final appRouter = AppRouter();

    return MaterialApp.router(
      title: 'Prompt Library',
      theme: AppTheme.darkTheme,
      routerConfig: appRouter.config(),
      builder: (context, child) {
        // Here we can wrap with a scaling widget or other global builders if needed
        return child!;
      },
    );
  }
}
