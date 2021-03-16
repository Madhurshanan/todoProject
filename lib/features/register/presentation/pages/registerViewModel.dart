import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobileuiintern/features/register/domain/usecases/registerUserCase.dart';
import 'package:stacked/stacked.dart';

class RegisterViewModel extends BaseViewModel {
  final RegisterUseCase registerUseCase;

  RegisterViewModel({@required this.registerUseCase})
      : assert(registerUseCase != null, 'Register usecase cannot be null');
  final nameOCntroller = TextEditingController();
  final passwordOCntroller = TextEditingController();

  Future<void> register() async {
    final res = await registerUseCase(Params(
        email: 'ravindutharaka23@gmail.com',
        password: 'afzal@123',
        username: 'afzal'));

    res.fold((l) {
      Get.snackbar('Error Occured', l.failureMessage);
    }, (r) {
      Get.snackbar('Success', r);
    });
  }
}
