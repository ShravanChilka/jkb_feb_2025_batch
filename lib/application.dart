import 'package:flutter/material.dart';
import 'package:jkb_feb_2025_batch/counter_screen_provider.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CounterScreenProvider());
  }
}
