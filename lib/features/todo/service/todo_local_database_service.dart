import 'package:jkb_feb_2025_batch/core/database/local_database.dart';
import 'package:jkb_feb_2025_batch/features/todo/model/create_todo_model.dart';
import 'package:jkb_feb_2025_batch/features/todo/model/todo_model.dart';

class TodoLocalDatabaseService {
  final db = LocalDatabase.instance;

  Future<List<TodoModel>> readAll() async {
    final result = await db.rawQuery(
      "SELECT * FROM Todos WHERE deletedAt IS NULL",
    );
    return result.map((map) => TodoModel.fromDatabaseMap(map)).toList();
  }

  Future<TodoModel> create(CreateTodoModel model) async {
    final id = await db.insert("Todos", model.toDatabaseMap());
    return TodoModel(
      id: id,
      title: model.title,
      description: model.description,
      completed: model.completed,
      priority: model.priority,
      createdAt: model.createdAt,
      deletedAt: model.deletedAt,
      updatedAt: model.updatedAt,
    );
  }

  Future<void> update(TodoModel updatedModel) async {
    await db.update(
      "Todos",
      updatedModel.toDatabaseUpdateMap(),
      where: "id = ?",
      whereArgs: [updatedModel.id],
    );
  }

  Future<void> delete(TodoModel model) async {
    await db.update("Todos", model.toDatabaseDeleteMap());
  }
}
