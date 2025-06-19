import 'package:flutter/material.dart';
import 'package:jkb_feb_2025_batch/features/recently_deleted/view_model/recently_deleted_view_model.dart';
import 'package:jkb_feb_2025_batch/features/todo/model/todo_model.dart';
import 'package:jkb_feb_2025_batch/features/todo/view/dialogs/todo_delete_dialog.dart';
import 'package:jkb_feb_2025_batch/features/todo/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';

class TodoDialogHelper {
  const TodoDialogHelper._();

  static final TodoDialogHelper instance = TodoDialogHelper._();

  void showDeleteConfirmationDialog({
    required BuildContext context,
    required TodoModel todo,
  }) async {
    final viewModel = context.read<TodoViewModel>();
    final result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return TodoDeleteDialog();
      },
    );
    if (result == true) {
      viewModel.delete(todo: todo).whenComplete(() {
        Navigator.of(context).pop();
      });
    }
    print(result);
  }

  void showPermanantlyDeleteConfirmationDialog({
    required BuildContext context,
    required TodoModel todo,
  }) async {
    final viewModel = context.read<RecentlyDeletedViewModel>();
    final result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return TodoDeleteDialog();
      },
    );
    if (result == true) {
      viewModel.delete(todo);
      Navigator.of(context).pop();
    }
  }
}
