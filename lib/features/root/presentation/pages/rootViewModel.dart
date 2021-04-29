import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileuiintern/features/agenda/presentation/pages/agenda.dart';
import 'package:mobileuiintern/features/login/presentation/pages/loginView.dart';
import 'package:mobileuiintern/features/root/domain/usecase/rootUseCasese.dart';
import 'package:stacked/stacked.dart';

class RootViewModel extends BaseViewModel {
  final RootUsecase rootUseCase;
  //final FirebaseAuth _firebaseAuth;

  RootViewModel(/*this._firebaseAuth,*/ {@required this.rootUseCase})
      : assert(rootUseCase != null, "Root usecase canot be null");
  Stream<User> loginCheck() {
    if (FirebaseAuth.instance.currentUser != null) {
      Get.to(Agenda());
    } else {
      Get.to(LoginView());
    }
  }
}

//mixin RootUseCase {}
