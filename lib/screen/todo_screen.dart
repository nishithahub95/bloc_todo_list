import 'package:bloc_todo_list/bloc/todo_bloc.dart';
import 'package:bloc_todo_list/bloc/todo_event.dart';
import 'package:bloc_todo_list/bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                if(state.todoList.isEmpty){
                  return const Text('No List found');
                }
                else if(state.todoList.isNotEmpty){
                  return ListView.builder(
                    shrinkWrap: true,
                      itemCount: state.todoList.length,
        
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.todoList[index].toString()),
                          trailing: IconButton(
                            onPressed: (){
                              context.read<TodoBloc>().add(RemoveTodoEvent(todo:state.todoList[index]));
                            },
                            icon: const Icon(Icons.delete),
                          ),
        
                        );
                      });
                }else{
                  return const SizedBox();
                }
        
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        for(int i=0;i<20;i++) {
          context.read<TodoBloc>().add(AddTodoEvent(toDo:'Todo:$i'));
        }
      },
     child:const Icon(Icons.add),
      ),
    );
  }
}
