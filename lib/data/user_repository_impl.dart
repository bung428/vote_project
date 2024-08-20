import 'package:flutter_riverpod_koo/river_pod/river_repository.dart';
import 'package:vote_project/domain/repository/user_repository.dart';
import 'package:vote_project/enums/gender.dart';
import 'package:vote_project/models/api/user_model.dart';
import 'package:vote_project/service/auth_service.dart';
import 'package:vote_project/service/firestore_service.dart';

class UserRepositoryImpl extends RiverRepository implements UserRepository {
  @override
  RiverRepository createRiverRepo() => UserRepositoryImpl();

  @override
  Future<bool> signIn(String id, String pwd) async {
    try {
      final query = await FirestoreService.instance
          .collection(StoreCollection.user)
          .where('id', isEqualTo: id)
          .get();
      if (query.docs.isEmpty) return false;
      final userData = UserModel.fromJson(query.docs.first.data());
      if (userData.id == id && userData.pwd == pwd) {
        await AuthService.instance.signIn(userData);
        return true;
      } else {
        return false;
      }
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> signUp(UserModel model) async {
    try {
      await FirestoreService.instance
          .collection(StoreCollection.user)
          .doc()
          .set(model.toJson());
      return true;
    } catch (_) {
      return false;
    }
  }
}