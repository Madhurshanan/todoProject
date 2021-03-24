import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobileuiintern/features/agenda/presentation/pages/agenda.dart';
import 'package:mobileuiintern/features/login/domain/usecases/loginUseCase.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  final LoginUseCase loginUseCase;

  LoginViewModel({@required this.loginUseCase})
      : assert(loginUseCase != null, 'Login usecase cannot be null');
  final nameOCntroller = TextEditingController();
  final passwordOCntroller = TextEditingController();

  Future<void> login() async {
    final res = await loginUseCase(
        Params(email: nameOCntroller.text, password: passwordOCntroller.text));

    res.fold((l) {
      Get.snackbar('Error Occured', l.failureMessage);
    }, (r) {
      Get.snackbar('Success', r);
      Get.to(Agenda());
    });
  }
}
