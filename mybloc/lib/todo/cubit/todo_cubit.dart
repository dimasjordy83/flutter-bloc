import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybloc/todo/model/todo.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    if (title.isEmpty) {
      addError('Title cannot be empty');
      return;
    }
    final todo = Todo(
      name: title,
      createdAt: DateTime.now(),
    );

    emit([...state, todo]);
  }

  void editTodo(String title, String newTitle) {
    final updateTodo = state.map((todo) {
      if (todo.name == title) {
        todo.name = newTitle;
      }
      return todo;
    }).toList();
    emit(updateTodo);
  }

  void delete(String title) {
    final updatedTodos = state.where((todo) => todo.name != title).toList();
    emit(updatedTodos);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}
