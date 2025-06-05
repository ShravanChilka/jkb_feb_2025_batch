import 'package:flutter/material.dart';
import 'package:jkb_feb_2025_batch/features/todo/view/widgets/todo_priority_option_builder.dart';
import 'package:jkb_feb_2025_batch/features/todo/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';

final _formKey = GlobalKey<FormState>();

class CreateTodoScreen extends StatefulWidget {
  const CreateTodoScreen({super.key});

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  final titleController = TextEditingController();
  final desriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Todo")),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Title*"),
                SizedBox(height: 4),
                TextFormField(
                  controller: titleController,
                  style: Theme.of(context).textTheme.titleLarge,
                  validator: (value) {
                    if (value == null) return "Title is required";
                    if (value.trim().isEmpty == true) {
                      return "Title is required";
                    }
                    if (value.trim().length <= 3) {
                      return "Title should have more than 3 characters";
                    }
                    return null;
                  },
                  maxLines: 2,
                  maxLength: 100,
                  decoration: InputDecoration(
                    hintText: "Enter title...",
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surfaceContainer,
                  ),
                ),
                SizedBox(height: 16),
                Text("Description"),
                SizedBox(height: 4),
                TextFormField(
                  controller: desriptionController,
                  maxLines: 5,
                  maxLength: 300,
                  validator: (value) {
                    return null;
                  },
                  style: Theme.of(context).textTheme.bodyLarge,
                  decoration: InputDecoration(
                    hintText: "Enter description...",
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surfaceContainer,
                  ),
                ),
                SizedBox(height: 16),
                Text("Priority"),
                SizedBox(height: 4),
                TodoPriorityOptionBuilder(),
                SizedBox(height: 16),
                Center(
                  child: FilledButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        context
                            .read<TodoViewModel>()
                            .create(
                              title: titleController.text,
                              description: desriptionController.text,
                            )
                            .whenComplete(() {
                              if (context.mounted) {
                                Navigator.of(context).pop();
                              }
                            });
                      }
                    },
                    child: Text("Create"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    desriptionController.dispose();
  }
}
