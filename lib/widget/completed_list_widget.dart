import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/provider/todos.dart';
import '/widget/todo_widget.dart';

class CompletedListWidget extends StatelessWidget {
  const CompletedListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<TodosProvider>().todosCompleted;

    return todos.isEmpty
        ? const Center(
            child: Text(
              'No completed tasks.',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(height: 8),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              return TodoWidget(todo: todo);
            },
          );
  }
}
