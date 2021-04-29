import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobileuiintern/features/root/presentation/pages/rootViewModel.dart';
import 'package:mobileuiintern/serviceLocator.dart';
import 'package:stacked/stacked.dart';

class RootView extends StatelessWidget {
  const RootView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RootViewModel>.reactive(
      builder: (context, model, widget) {
        return RootViewModel();
      },
      viewModelBuilder: () => locator<RootViewModel>(),
    );
  }
}

// class RootView extends StatelessWidget {
//   const RootView({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<RootViewModel>.reactive(
//       onModelReady: (model) => {}, //model.handleStartUpLogic(),
//       builder: (context, model, widget) {

//      );
//       }
//       }
// }
