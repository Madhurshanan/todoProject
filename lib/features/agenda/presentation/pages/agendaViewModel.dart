import 'package:get/get.dart';
import 'package:mobileuiintern/core/usecases/usecase.dart';
import 'package:mobileuiintern/features/agenda/domain/entites/agendaEntities.dart';
import 'package:mobileuiintern/features/agenda/domain/usecases/agendaUsecaseDelete.dart';
import 'package:mobileuiintern/features/agenda/domain/usecases/streamUseCase.dart'
    as streamUse;
import 'package:stacked/stacked.dart';

import 'package:mobileuiintern/features/agenda/domain/usecases/agendaUseCaseGetTodo.dart';

class AgendaViewModel extends StreamViewModel<List<AgendaEntities>> {
  AgendaUseCaseGetTodo agendaUseCaseGetTodo;
  AgendaUsecaeDelete agendaUsecaeDelete;
  final streamUse.AgendaStreamUsecase agendaStreamUsecase;

  AgendaViewModel(
      {this.agendaUseCaseGetTodo,
      this.agendaUsecaeDelete,
      this.agendaStreamUsecase,
      });
  List<AgendaEntities> listAgenda = [];

  Future<void> deleteTodo(int index) async {
    final del =
        await agendaUsecaeDelete(Params(docId: listAgenda[index].docId));
    del.fold((l) {
      Get.snackbar('Error Occured', l.failureMessage);
    }, (r) {
      Get.snackbar(
        "Deleteted Todo",
        "Sucsessfully Deleted",
      );
    });
  }

  Future<void> getTooAgenda() async {
    final res = await agendaUseCaseGetTodo(NoParams());
    res.fold((l) {
      Get.snackbar('Error Occured', l.failureMessage);
    }, (r) {
      listAgenda = r;
      notifyListeners();
    });
  }

//Q
  List<AgendaEntities> get todos => data;
  @override
  // TODO: implement stream
  Stream<List<AgendaEntities>> get stream => agendaStreamUsecase(NoParams());
}
 