import 'package:flutter/material.dart';
import 'package:test_work/locator_service.dart' as di;
import 'feature/presentation/my_app.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}



