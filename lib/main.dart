import 'package:flutter/material.dart';
import 'package:flutter_application_sample/app/app.dart';
import 'package:flutter_application_sample/app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp());
}
