import 'package:exam_api/core/services/services_locator.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  serviceInit();
  runApp(const MyApp());
}
