import 'package:flutter/material.dart';
import 'package:jkb_feb_2025_batch/features/todo/view/todo_screen.dart';
import 'package:jkb_feb_2025_batch/features/todo/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';

class TodoScreenProvider extends StatelessWidget {
  const TodoScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoViewModel(),
      child: TodoScreen(),
    );
  }
}
