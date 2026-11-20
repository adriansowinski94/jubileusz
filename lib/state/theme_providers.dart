import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app/theme.dart';

/// Akcent całej apki – docelowo kolor aktualnego lidera turnieju.
class AccentColor extends Notifier<Color> {
  @override
  Color build() => AppColors.gold;

  void set(Color color) => state = color;
}

final accentColorProvider =
    NotifierProvider<AccentColor, Color>(AccentColor.new);
