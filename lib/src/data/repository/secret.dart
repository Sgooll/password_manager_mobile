import 'package:password_manager/src/data/api/secret_api.dart';

class PasswordRepository extends PasswordApi {
  @override
  Future<bool?> join() async {
    return true;
  }
}
