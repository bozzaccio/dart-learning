abstract class Rest<T> {
  Future<T> get(String id);
  Future<List> getAll();
  Future<String> delete(String id);
  Future<T> create(T obj);
  Future<T> update(T obj);
}
