import 'package:bta3_physia/app/app_initializer.dart';
import 'package:bta3_physia/app/bta3_physia_app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await AppInitializer.initialize();
  runApp(const Bta3PhysiaApp());
}
