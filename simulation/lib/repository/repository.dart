abstract class Repository {
  Future<bool> saveJson(Map<String, dynamic> json, String key);
  Future<bool> saveInt(int index, String key);

  Future<Map<String, dynamic>> loadJson(String key);
  Future<int> loadIndex(String key);

  Future<void> remove(String key);
}
