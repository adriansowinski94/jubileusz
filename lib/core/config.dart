/// Konfiguracja wstrzykiwana przy budowaniu:
/// `flutter run --dart-define-from-file=config.json`
/// Plik config.json jest w .gitignore (wzór: config.example.json).
class AppConfig {
  const AppConfig._();

  static const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const supabaseKey = String.fromEnvironment('SUPABASE_KEY');
  static const appName = String.fromEnvironment(
    'APP_NAME',
    defaultValue: 'JubileuszApp',
  );

  static bool get isConfigured =>
      supabaseUrl.isNotEmpty && supabaseKey.isNotEmpty;
}
