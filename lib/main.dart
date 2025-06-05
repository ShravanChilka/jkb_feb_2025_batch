import 'package:flutter/material.dart';
import 'package:jkb_feb_2025_batch/application.dart';
import 'package:jkb_feb_2025_batch/core/database/local_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDatabase.init();
  runApp(const Application());
}
