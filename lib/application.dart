import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jkb_feb_2025_batch/features/todo/view/todo_screen_provider.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: GoogleFonts.dmSans().fontFamily),
      home: TodoScreenProvider(),
    );
  }
}
