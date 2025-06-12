import 'package:flutter/material.dart';
import 'package:jkb_feb_2025_batch/features/todo/view/widgets/full_screen_loader_widget.dart';
import 'package:jkb_feb_2025_batch/features/todo/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';

class CreateTodoFullScreenLoaderWrapper extends StatelessWidget {
  const CreateTodoFullScreenLoaderWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Selector<TodoViewModel, bool>(
      selector: (context, viewModel) => viewModel.isLoading,
      builder: (context, isLoading, _) {
        return Stack(
          children: [
            child,
            if (isLoading) Positioned.fill(child: FullScreenLoaderWidget()),
          ],
        );
      },
    );
  }
}
