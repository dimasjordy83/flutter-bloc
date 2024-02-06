import 'package:flutter/material.dart';
import 'package:mybloc/todo/cubit/todo_cubit.dart';
import 'package:mybloc/todo/model/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;

  const EditTodoPage({Key? key, required this.todo}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.todo.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Editing todo:'),
            SizedBox(height: 10),
            TextFormField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  labelText: 'Edit title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Update the todo name
                // widget.todo.name = _textEditingController.text;
                context.read<TodoCubit>().editTodo(
                    widget.todo.name, _textEditingController.text.trim());

                Navigator.pop(context);
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose the controller to avoid memory leaks
    _textEditingController.dispose();
    super.dispose();
  }
}
