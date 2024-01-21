
import 'app/coffee_app.dart';
import 'package:flutter/material.dart';
import 'core/helper/dio_helper.dart';
import 'core/helper/local_database.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.intDio();
  await LocalDatabaseHelper.init();
  runApp(const CoffeeApp());
}
