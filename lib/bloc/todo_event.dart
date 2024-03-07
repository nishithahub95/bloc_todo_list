

import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable{
 const TodoEvent();
}
class AddTodoEvent extends TodoEvent{
  final String toDo;
 const AddTodoEvent({
    required this.toDo
});
  @override
  // TODO: implement props
  List<Object?> get props => [toDo];

}

class RemoveTodoEvent extends TodoEvent{
  final Object todo;
  const RemoveTodoEvent({required this.todo});
  @override
  // TODO: implement props
  List<Object?> get props => [todo];

}
