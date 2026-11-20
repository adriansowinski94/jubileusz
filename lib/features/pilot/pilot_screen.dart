import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

/// Etap 0: zaślepka trybu pilota (etap 6).
class PilotScreen extends StatelessWidget {
  const PilotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilot'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: const Center(child: Text('Pilot – wkrótce')),
    );
  }
}
