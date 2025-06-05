import 'package:flutter/material.dart';
import 'package:jkb_feb_2025_batch/features/todo/model/todo_priority.dart';
import 'package:jkb_feb_2025_batch/features/todo/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';

class TodoPriorityOptionBuilder extends StatelessWidget {
  const TodoPriorityOptionBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<TodoViewModel, TodoPriority>(
      selector: (context, viewModel) => viewModel.selectedPriority,
      builder: (context, selectedPriority, child) {
        return Row(
          children:
              TodoPriority.values
                  .map(
                    (priority) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ChoiceChip(
                        label: Text(priority.name),
                        onSelected: (value) {
                          if (value) {
                            context
                                .read<TodoViewModel>()
                                .onPriorityChangedEvent(priority);
                          }
                        },
                        selected: priority == selectedPriority,
                      ),
                    ),
                  )
                  .toList(),
        );
      },
    );
  }
}
