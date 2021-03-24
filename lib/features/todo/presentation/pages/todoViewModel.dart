import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobileuiintern/features/agenda/presentation/pages/agenda.dart';
import 'package:mobileuiintern/features/todo/domain/usecases/todoUsecaseInsert.dart';
import 'package:stacked/stacked.dart';

class TodoViewModel extends BaseViewModel {
  final TodoUsecaeInsert todoUsecaeInsert;

  TodoViewModel({@required this.todoUsecaeInsert})
      : assert(todoUsecaeInsert != null, 'Todo usecase cannot be null');
  final titleOController = TextEditingController();
  final descriptionOController = TextEditingController();

  Future<void> addTodo() async {
    final res = await todoUsecaeInsert(Params(
        description: descriptionOController.text,
        title: titleOController.text));

    res.fold((l) {
      Get.snackbar('Error Occured', l.failureMessage);
    }, (r) {
      Get.snackbar('Success', "Added");
      Get.to(Agenda());
    });
  }
}
