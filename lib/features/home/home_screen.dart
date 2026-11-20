import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../../core/config.dart';
import '../../core/player_palette.dart';
import '../../data/supabase_providers.dart';
import '../../state/theme_providers.dart';

/// Etap 0: ekran kontrolny – połączenie z bazą + podgląd dynamicznego motywu.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pool = ref.watch(gamePoolCountProvider);
    final accent = ref.watch(accentColorProvider);

    return Scaffold(
      appBar: AppBar(title: const Text(AppConfig.appName)),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'CENTRUM DOWODZENIA',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 4,
                  color: accent,
                  shadows: [Shadow(color: accent, blurRadius: 24)],
                ),
              ),
              const SizedBox(height: 24),
              pool.when(
                data: (n) => Text('Połączono z bazą • gier w puli: $n'),
                loading: () => const CircularProgressIndicator(),
                error: (e, _) => Text(
                  'Błąd połączenia: $e',
                  style: const TextStyle(color: Colors.redAccent),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Podgląd kolorów graczy (kliknij):',
                style: TextStyle(color: AppColors.textMuted),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  for (final c in PlayerPalette.all)
                    ActionChip(
                      label: Text(c.label, style: TextStyle(color: c.onColor)),
                      backgroundColor: c.color,
                      onPressed: () =>
                          ref.read(accentColorProvider.notifier).set(c.color),
                    ),
                ],
              ),
              const SizedBox(height: 32),
              FilledButton.icon(
                onPressed: () => context.go('/pilot'),
                icon: const Icon(Icons.phone_android),
                label: const Text('Tryb pilota'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
