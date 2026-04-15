abstract interface class HashService {
  Future<String> hash(String value);

  Future<bool> verify(String value, String hash);
}
