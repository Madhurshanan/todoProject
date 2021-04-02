import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileuiintern/core/usecases/usecase.dart';
import 'package:mobileuiintern/features/agenda/domain/entites/agendaEntities.dart';
import 'package:mobileuiintern/features/agenda/domain/usecases/agendaUsecaseDelete.dart';
import 'package:stacked/stacked.dart';

import 'package:mobileuiintern/features/agenda/domain/usecases/agendaUseCaseGetTodo.dart';

class AgendaViewModel extends BaseViewModel {
  AgendaUseCaseGetTodo agendaUseCaseGetTodo;
  AgendaUsecaeDelete agendaUsecaeDelete;

  AgendaViewModel(
      {@required this.agendaUseCaseGetTodo, this.agendaUsecaeDelete});
  List<AgendaEntities> listAgenda = [];

  Future<void> deleteTodo(int index) async {
    final del =
        await agendaUsecaeDelete(Params(docId: listAgenda[index].docId));
    del.fold((l) {
      Get.snackbar('Error Occured', l.failureMessage);
    }, (r) {
      Get.snackbar("Deleteted Todo","Sucsessfully Deleted",);
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
}
