import 'package:material_ui/material_ui.dart';

/// Kolor do wyboru przez gracza na starcie turnieju.
class PlayerColor {
  const PlayerColor(this.id, this.label, this.color);

  final String id;
  final String label;
  final Color color;

  /// Czarny lub biały tekst – zależnie od jasności koloru gracza.
  Color get onColor =>
      ThemeData.estimateBrightnessForColor(color) == Brightness.dark
          ? Colors.white
          : Colors.black;

  /// Zapis do bazy, np. `#2D8CFF`.
  String get hex =>
      '#${(color.toARGB32() & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';
}

/// 8 kolorów graczy. Złoto zarezerwowane dla pucharu / mistrza.
class PlayerPalette {
  const PlayerPalette._();

  static const List<PlayerColor> all = [
    PlayerColor('blue', 'Niebieski', Color(0xFF2D8CFF)),
    PlayerColor('green', 'Zielony neon', Color(0xFF39FF14)),
    PlayerColor('red', 'Czerwony', Color(0xFFFF3B30)),
    PlayerColor('orange', 'Pomarańczowy', Color(0xFFFF9500)),
    PlayerColor('purple', 'Fioletowy', Color(0xFFAF52DE)),
    PlayerColor('pink', 'Różowy', Color(0xFFFF2D95)),
    PlayerColor('teal', 'Turkusowy', Color(0xFF00E5D4)),
    PlayerColor('silver', 'Srebrny', Color(0xFFE5E5EA)),
  ];

  static PlayerColor? byHex(String hex) {
    final normalized = hex.toUpperCase();
    for (final c in all) {
      if (c.hex == normalized) return c;
    }
    return null;
  }
}
