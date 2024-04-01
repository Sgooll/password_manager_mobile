abstract class AuthApi {

  String loginAddress = 'auth/login';
  Future<String?> login();

}