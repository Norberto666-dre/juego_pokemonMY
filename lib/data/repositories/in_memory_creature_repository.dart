import 'dart:async';
import '../../domain/repositories/creature_repository.dart';

class InMemoryCreatureRepository implements CreatureRepository {
  final _items = <Map<String, dynamic>>[];
  final _controller = StreamController<List<Map<String, dynamic>>>.broadcast();

  void _emit() => _controller.add(List<Map<String, dynamic>>.from(_items));

  @override
  Stream<List<Map<String, dynamic>>> watchAll() {
    _emit();
    return _controller.stream;
  }

  @override
  Future<void> add(Map<String, dynamic> row) async {
    _items.add(Map<String, dynamic>.from(row));
    _emit();
  }

  @override
  Future<void> remove(String uid) async {
    _items.removeWhere((r) => r['uid'] == uid);
    _emit();
  }
}
