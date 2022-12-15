import 'package:flutter/material.dart';
import 'package:flutter_application_sample/app/app.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  void updateState() {
    MyApp.instance.appState = 10;
  }

  void getAppState() {
    print(MyApp.instance.appState);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
