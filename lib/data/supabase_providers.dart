import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabaseProvider = Provider<SupabaseClient>(
  (ref) => Supabase.instance.client,
);

/// Etap 0: test połączenia – liczba aktywnych gier w puli.
final gamePoolCountProvider = FutureProvider<int>((ref) async {
  final rows = await ref
      .watch(supabaseProvider)
      .from('games')
      .select('id')
      .eq('active', true);
  return rows.length;
});
