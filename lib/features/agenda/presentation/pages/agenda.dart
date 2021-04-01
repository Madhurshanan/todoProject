import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileuiintern/features/agenda/presentation/pages/agendaViewModel.dart';
import 'package:mobileuiintern/features/agenda/presentation/widgets/taskWidget.dart';
import 'package:mobileuiintern/features/profile/presentation/pages/profile.dart';
import 'package:mobileuiintern/features/todo/presentation/widgets/displayTodo.dart';
import 'package:stacked/stacked.dart';

import '../../../../serviceLocator.dart';
import '../widgets/taskWidget.dart';

class Agenda extends StatelessWidget {
  int _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AgendaViewModel>.reactive(
        onModelReady: (model) async {
          await model.getTooAgenda();
          //await model.deleteTodoAgenda(index);
        },
        builder: (context, model, widget) {
          //return SingleChildScrollView(
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Get.to(Profile());
                },
                icon: Icon(
                  Icons.account_circle_sharp,
                  size: 50.0,
                  color: Colors.black,
                ),
              ),
              title: Text("Agenda"),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.menu_book_sharp), title: Text("MY TODOS")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add), title: Text("NEW TODO")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle), title: Text("PROFILE")),
              ],
              onTap: (index) {
                _currentindex = index;
              },
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      child: MaterialButton(
                        child: Icon(Icons.add, color: Colors.white, size: 50.0),
                        minWidth: double.infinity,
                        height: 60.0,
                        onPressed: () => showDialog(
                          context: context,
                          child: AddTodo(),
                          barrierDismissible: false,
                        ),
                        color: Colors.purple,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      ),
                  // Container(
                  //   child: SingleChildScrollView(
                  //     child:
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onLongPress: () async {
                          await model.deleteTodo(index);
                        },
                        child: TaskWidget(
                          color: Colors.blue,
                          description: model.listAgenda[index].description,
                          titile: model.listAgenda[index].title,
                        ),
                      );
                    },
                    itemCount:
                        model.listAgenda != null ? model.listAgenda.length : 0,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                  ),
                ],
              ),
            ),
          );
        },
        viewModelBuilder: () => locator<AgendaViewModel>());
  }
}
