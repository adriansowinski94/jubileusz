import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/config.dart';
import '../state/theme_providers.dart';
import 'router.dart';
import 'theme.dart';

class JubileuszApp extends ConsumerWidget {
  const JubileuszApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accent = ref.watch(accentColorProvider);
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      theme: buildTheme(accent),
      themeAnimationDuration: const Duration(milliseconds: 600),
      routerConfig: router,
    );
  }
}
