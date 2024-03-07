

import 'package:bloc/bloc.dart';
import 'package:bloc_todo_list/bloc/todo_event.dart';
import 'package:bloc_todo_list/bloc/todo_state.dart';


class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> todoList=[];
  TodoBloc() : super(const TodoState()){
    on<AddTodoEvent>(_addTodoEvent);
    on<RemoveTodoEvent>(_removeTodoEvent);
  }

void _addTodoEvent(AddTodoEvent event,Emitter<TodoState> emit){
    todoList.add(event.toDo);
    emit(state.copyWith(todoList:List.from(todoList) ));

}
  void _removeTodoEvent(RemoveTodoEvent event,Emitter<TodoState> emit){
    todoList.remove(event.todo);
    emit(state.copyWith(todoList:List.from(todoList) ));

  }
}
