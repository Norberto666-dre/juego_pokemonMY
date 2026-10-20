abstract interface class CreatureRepository {
  Stream<List<Map<String,dynamic>>> watchAll();
  Future<void> add(Map<String,dynamic> row);
  Future<void> remove(String uid);
}
