import 'package:flutter/material.dart';
import 'package:mybloc/todo/cubit/todo_cubit.dart';
import 'package:mybloc/todo/model/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybloc/todo/pages/edit_todo.dart';

import 'add_todo.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Page'),
      ),
      body: Column(children: [
        const Text('List of Todos:'),
        Expanded(child:
            BlocBuilder<TodoCubit, List<Todo>>(builder: (context, todos) {
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ListTile(
                title: Text(todo.name),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EditTodoPage(
                              todo: todo,
                            ),
                          ),
                        );
                      },
                      // onPressed: () {
                      //   _editTodo(context, todo);
                      // },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        context.read<TodoCubit>().delete(todo.name);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),

                // onLongPress: () {
                //   _deleteTodo(context, todo);
                // },
              );
            },
          );
        }))
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddTodoPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  // // Fungsi untuk mengedit todo
  // void _editTodo(BuildContext context, Todo todo) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => EditTodoPage(
  //         todo: todo,
  //       ),
  //     ),
  //   );
  // }

  // // Fungsi untuk menghapus todo
  // void _deleteTodo(BuildContext context, Todo todo) {
  //   context.read<TodoCubit>().deleteTodo(todo);
  // }
}
