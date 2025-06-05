import 'package:flutter/material.dart';
import 'package:jkb_feb_2025_batch/features/todo/model/create_todo_model.dart';
import 'package:jkb_feb_2025_batch/features/todo/model/todo_model.dart';
import 'package:jkb_feb_2025_batch/features/todo/model/todo_priority.dart';
import 'package:jkb_feb_2025_batch/features/todo/service/todo_local_database_service.dart';

class TodoViewModel extends ChangeNotifier {
  List<TodoModel> todos = [];

  final service = TodoLocalDatabaseService();

  TodoPriority selectedPriority = TodoPriority.low;

  void fetch() async {
    todos = await service.readAll();
    notifyListeners();
  }

  Future<void> create({
    required String title,
    required String description,
  }) async {
    final model = CreateTodoModel(
      title: title.trim(),
      description: description.trim().isEmpty ? null : description,
      completed: false,
      priority: selectedPriority,
      createdAt: DateTime.now(),
    );
    final createdTodo = await service.create(model);
    todos = [...todos, createdTodo];
    notifyListeners();
    print("Todo created!");
  }

  void onPriorityChangedEvent(TodoPriority priority) {
    selectedPriority = priority;
    notifyListeners();
  }
}
