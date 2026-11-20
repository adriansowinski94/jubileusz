import 'package:material_ui/material_ui.dart';

import 'theme.dart';

/// Pokazywane, gdy apka została uruchomiona bez config.json.
class ConfigErrorApp extends StatelessWidget {
  const ConfigErrorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildTheme(AppColors.gold),
      home: const Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              'Brak konfiguracji Supabase.\n'
              'Uruchom z: --dart-define-from-file=config.json',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
