import 'package:flutter/material.dart';
import 'package:jkb_feb_2025_batch/features/todo/model/todo_sort.dart';
import 'package:jkb_feb_2025_batch/features/todo/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';

class TodoSortDropDownButton extends StatelessWidget {
  const TodoSortDropDownButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<TodoViewModel, TodoSort>(
      selector: (_, viewModel) => viewModel.sort,
      builder: (context, selectedSort, child) {
        return DropdownButton<TodoSort>(
          items:
              TodoSort.options.map((sort) {
                return DropdownMenuItem(value: sort, child: Text(sort.name));
              }).toList(),
          onChanged: (value) {
            if (value == null) return;
            context.read<TodoViewModel>().onSortChangedEvent(value);
          },
          value: selectedSort,
        );
      },
    );
  }
}
