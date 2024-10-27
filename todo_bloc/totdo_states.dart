import 'package:equatable/equatable.dart';
import 'package:to_do_app/data/todo.dart';

enum TodoStates { initial, loading, succes, error }

class TodoState extends Equatable {
  final List<Todo> todos;
  final TodoStates status;
  const TodoState({
    this.todos = const [],
    this.status = TodoStates.initial,
  });

  TodoState copyWith({
    List<Todo>? todos,
    TodoStates? status,
  }) {
    return TodoState(
      todos: todos ?? this.todos,
      status: status ?? this.status,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
