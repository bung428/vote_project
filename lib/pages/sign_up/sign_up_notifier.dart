import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_koo/river_pod/river_notifier.dart';
import 'package:vote_project/domain/use_case/get_sign_up_use_case.dart';
import 'package:vote_project/enums/gender.dart';
import 'package:vote_project/models/api/user_model.dart';
import 'package:vote_project/service/firestore_service.dart';

class SignUpNotifier extends RiverNotifier<bool> {
  final GetSignUpUseCase signUpUseCase;

  SignUpNotifier(super.state, this.signUpUseCase);

  final idController = TextEditingController();
  final pwdController = TextEditingController();
  final rePwdController = TextEditingController();

  List<bool> genderSelected = [true, false];

  @override
  void onInit() {
    idController.addListener(_updateEnable);
    pwdController.addListener(_updateEnable);
    rePwdController.addListener(_updateEnable);
  }

  @override
  void dispose() {
    idController.removeListener(_updateEnable);
    pwdController.removeListener(_updateEnable);
    rePwdController.removeListener(_updateEnable);
    super.dispose();
  }

  void _updateEnable() {
    var lowerCasedText = idController.text.toLowerCase();
    if (idController.text != lowerCasedText) {
      idController.value = idController.value.copyWith(
        text: lowerCasedText,
        selection: TextSelection.collapsed(offset: lowerCasedText.length),
      );
    }

    final selected = genderSelected.indexWhere((e) => e);
    final gender = Gender.values.firstWhereOrNull((e) => e.index == selected);

    state = idController.text.isNotEmpty &&
        pwdController.text.isNotEmpty &&
        rePwdController.text.isNotEmpty &&
        pwdController.text.trim() == rePwdController.text.trim() &&
        gender != null
    ;
  }

  void setGender(int index) {
    for (int idx=0; idx<genderSelected.length; idx ++) {
      if (index == idx) {
        genderSelected[idx] = true;
      } else {
        genderSelected[idx] = false;
      }
    }
    _updateEnable();
  }

  Future<void> signUp() async {
    final docRef = FirestoreService.instance.collection(StoreCollection.user).doc();
    final docId = docRef.id;

    final selected = genderSelected.indexWhere((e) => e);
    final gender = Gender.values.firstWhereOrNull((e) => e.index == selected);
    if (gender == null) return;

    final model = UserModel(
        uid: docId,
        id: idController.text,
        pwd: pwdController.text,
        gender: gender
    );
    await docRef.set(model.toJson());
  }
}