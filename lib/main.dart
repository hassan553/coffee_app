import 'package:coffee_app/app/coffee_app.dart';
import 'package:flutter/material.dart';

import 'core/helper/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.intDio();
  runApp(const CoffeeApp());
}
