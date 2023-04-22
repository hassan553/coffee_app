
import 'app/coffee_app.dart';
import 'package:flutter/material.dart';
import 'core/helper/dio_helper.dart';
import 'core/helper/local_database.dart';
import 'core/services/services_lecator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLector.init();
  DioHelper.intDio();
  await LocalDatabaseHelper.init();
  runApp(const CoffeeApp());
}
