import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobileuiintern/features/register/domain/usecases/registerUserCase.dart';
import 'package:stacked/stacked.dart';

class RegisterViewModel extends BaseViewModel {
  final RegisterUseCase registerUseCase;

  RegisterViewModel({@required this.registerUseCase})
      : assert(registerUseCase != null, 'Register usecase cannot be null');
  final emailOCntroller = TextEditingController();
  final passwordOCntroller = TextEditingController();
  final nameOCntroller = TextEditingController();

  Future<void> register() async {
    final res = await registerUseCase(Params(
        email: emailOCntroller.text,
        password: passwordOCntroller.text,
        username: nameOCntroller.text));

    res.fold((l) {
      Get.snackbar('Error Occured', l.failureMessage);
    }, (r) {
      Get.snackbar('Success', r);
    });
  }
}
