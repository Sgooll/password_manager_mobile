abstract class AuthApi {

  String loginAddress = 'auth/sign-in';
  Future<String?> login();

}