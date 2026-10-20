import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../../../core/di/providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(_creaturesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio')),
      body: async.when(
        data: (items) => items.isEmpty
            ? const Center(child: Text('Sin criaturas. Agrega una.'))
            : ListView.builder(
                itemCount: items.length,
                itemBuilder: (_, i) => ListTile(
                  title: Text('Criatura ${items[i]['uid']}'),
                  subtitle: Text(
                      'Especie ${items[i]['speciesId']} · Nv ${items[i]['level']}'),
                ),
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await ref.read(creatureRepositoryProvider).add({
            'uid': DateTime.now().millisecondsSinceEpoch.toString(),
            'speciesId': 1,
            'level': 5,
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

final _creaturesProvider = StreamProvider<List<Map<String, dynamic>>>((ref) {
  return ref.watch(creatureRepositoryProvider).watchAll();
});
