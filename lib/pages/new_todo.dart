import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';

class NewTodo extends StatelessWidget {
  NewTodo({Key? key}) : super(key: key);

  final TextEditingController itemController = TextEditingController();
  List<Todo> items = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Nova tarefa'),
          centerTitle: true,
          backgroundColor: Color(0xff121212),
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        //controller: itemControler,
                        style: TextStyle(
                          color: Color(0xffeeeeee),
                        ),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffeeeeee),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffa7a6a6),
                            ),
                          ),
                          labelText: 'Adicionar uma tarefa',
                          labelStyle: TextStyle(
                            color: Color(0xffeeeeee),
                          ),
                          hintText: 'Ex.: Estudar',
                          hintStyle: TextStyle(
                            color: Color(0xffa7a6a6),
                          ),
                          //errorText: errorText,
                          fillColor: Color(0xff121212),
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // String text = itemControler.text;

                        // if (text.isEmpty) {
                        //   setState(() {
                        //     errorText = 'Você deve preencher esse campo';
                        //   });
                        //   return;
                        //}

                        // Todo todo = Todo(
                        //   title: text,
                        //   date: DateTime.now(),
                        // );
                        // setState(() {
                        //   todos.add(todo);
                        //   errorText = null;
                        // });
                        // itemControler.clear();
                        // todoRepository.saveTodoList(todos);
                      },
                      child: Icon(
                        Icons.add,
                        size: 30,
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(14),
                        primary: Color(0xff121212),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
