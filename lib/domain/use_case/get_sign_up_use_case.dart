import 'package:vote_project/domain/repository/user_repository.dart';
import 'package:vote_project/models/api/user_model.dart';

class GetSignUpUseCase {
  final UserRepository repository;

  GetSignUpUseCase(this.repository);

  Future<bool> call(UserModel model) async {
    return await repository.signUp(model);
  }
}