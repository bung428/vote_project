import 'package:vote_project/domain/repository/user_repository.dart';

class GetLoginUseCase {
  final UserRepository repository;

  GetLoginUseCase(this.repository);

  Future<bool> call(String id, String pwd) async {
    return await repository.signIn(id, pwd);
  }
}