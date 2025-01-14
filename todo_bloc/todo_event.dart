import 'package:equatable/equatable.dart';
import 'package:to_do_app/data/todo.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object?> get props => [];
}

class TodoStarted extends TodoEvent {}

class AddTodo extends TodoEvent {
  final Todo todo;
  const AddTodo(this.todo);
  List<Object> get props => [todo];
}

class RemoveTodo extends TodoEvent {
  final Todo todo;
  const RemoveTodo(this.todo);

  List<Object> get props => [todo];
}

class AlterTodo extends TodoEvent {
  final int index;
  const AlterTodo(this.index);

  List<Object> get props => [index];
}
