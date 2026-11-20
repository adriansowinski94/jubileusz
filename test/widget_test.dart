import 'package:flutter_test/flutter_test.dart';
import 'package:jubileusz/app/config_error_app.dart';

void main() {
  testWidgets('Bez konfiguracji pokazuje komunikat', (tester) async {
    await tester.pumpWidget(const ConfigErrorApp());
    expect(find.textContaining('Brak konfiguracji'), findsOneWidget);
  });
}
