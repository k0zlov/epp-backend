enum TokenType { access, refresh }

abstract interface class TokenService {
  /// Used by the Auth Context during login
  String issueToken({required String userId, required Duration expiresIn, required TokenType type});

  bool isValid(String token, [TokenType type = TokenType.access]);

  String? extractUserId(String token, [TokenType type = TokenType.access]);
}
