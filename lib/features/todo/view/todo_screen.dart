import 'package:flutter/material.dart';
import 'package:jkb_feb_2025_batch/features/todo/utils/todo_strings.dart';
import 'package:jkb_feb_2025_batch/features/todo/view/create_todo_screen.dart';
import 'package:jkb_feb_2025_batch/features/todo/view/widgets/todo_list_view_builder.dart';
import 'package:jkb_feb_2025_batch/features/todo/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (context.mounted) context.read<TodoViewModel>().fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(TodoStrings.todosAppBarTitle)),
      body: TodoListViewBuilder(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder:
                  (_) => ChangeNotifierProvider.value(
                    value: context.read<TodoViewModel>(),
                    child: CreateTodoScreen(),
                  ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
