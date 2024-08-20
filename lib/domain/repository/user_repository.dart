import 'package:vote_project/models/api/user_model.dart';

abstract class UserRepository {
  Future<bool> signIn(String id, String pwd);
  Future<bool> signUp(UserModel model);
}