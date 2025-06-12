import 'package:flutter/material.dart';
import 'package:jkb_feb_2025_batch/features/todo/model/todo_model.dart';
import 'package:jkb_feb_2025_batch/features/todo/view/widgets/todo_list_view.dart';
import 'package:jkb_feb_2025_batch/features/todo/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';

class TodoListViewBuilder extends StatelessWidget {
  const TodoListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<TodoViewModel, List<TodoModel>>(
      selector: (context, viewModel) => viewModel.todos,
      builder: (context, todos, child) {
        return TodoListView(todos: todos);
      },
    );
  }
}
