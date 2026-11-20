import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jubileusz/core/player_palette.dart';

void main() {
  test('Paleta ma 8 unikalnych kolorów', () {
    expect(PlayerPalette.all.length, 8);
    expect(PlayerPalette.all.map((c) => c.hex).toSet().length, 8);
    expect(PlayerPalette.all.map((c) => c.id).toSet().length, 8);
  });

  test('Hex w formacie bazy i wyszukiwanie po hex', () {
    expect(PlayerPalette.all.first.hex, '#2D8CFF');
    expect(PlayerPalette.byHex('#39ff14')?.id, 'green');
    expect(PlayerPalette.byHex('#000000'), isNull);
  });

  test('Jasne kolory mają czarny tekst', () {
    expect(PlayerPalette.byHex('#E5E5EA')!.onColor, Colors.black);
    expect(PlayerPalette.byHex('#39FF14')!.onColor, Colors.black);
  });
}
