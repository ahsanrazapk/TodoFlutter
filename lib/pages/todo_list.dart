import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/pages/help.dart';
import 'package:todo/repositories/todo_repositories.dart';
import 'package:todo/widgets/todolistitem.dart';

import 'new_todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TextEditingController itemControler = TextEditingController();
  final TodoRepository todoRepository = TodoRepository();

  List<Todo> todos = [];

  Todo? deletedTodo;
  int? deletedPosition;

  String? errorText;

  @override
  void initState() {
    super.initState();

    todoRepository.getTodoList().then((value) {
      setState(() {
        todos = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              icon: Icon(Icons.menu),
            ),
          ),
          title: Text('Minhas Tarefas'),
          backgroundColor: Color(0xff121212),
          //Color(0xffa52a2a),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewTodo(),
                  ),
                );
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        drawer: Drawer(
          backgroundColor: Color(0xffe8e8e8),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff121212),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      'Olá, Josh',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.check),
                title: Text('Finalizadas'),
                onTap: () {
                  // change app state...
                  Navigator.pop(context); // close the drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Configurações'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('Ajuda'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Help()));
                },
              ),
              // ListTile(
              //   leading: Icon(Icons.info),
              //   title: Text('Sobre'),
              //   onTap: () {
              //     Navigator.pop(context); // Fechar o drawer
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => About()));
              //   },
              // ),
            ],
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 16,
                ),
                Flexible(
                  child: ListView(
                    children: [
                      for (Todo todo in todos)
                        TodoListItem(
                          todo: todo,
                          onDelete: onDelete,
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Você possui ${todos.length} tarefas pendentes',
                        style: TextStyle(
                          color: Color(0xffeeeeee),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                      onPressed: showDeletedTodosConfirmationDialog,
                      child: Text('Limpar tudo'),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff121212),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onDelete(Todo todo) {
    deletedTodo = todo;
    deletedPosition = todos.indexOf(todo);

    setState(() {
      todos.remove(todo);
    });
    todoRepository.saveTodoList(todos);

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Tarefa ${todo.title} removida com sucesso'),
        action: SnackBarAction(
          label: 'Desfazer',
          textColor: Colors.blueAccent,
          onPressed: () {
            setState(() {
              todos.insert(deletedPosition!, deletedTodo!);
            });
            todoRepository.saveTodoList(todos);
          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  void showDeletedTodosConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Limpar tudo?'),
        content: Text(
            'Essa ação não poderá ser desfeita, você tem certeza que deseja remover todas as tarefas pendentes?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              deleteAllTodos();
            },
            child: Text('Sim'),
            style: TextButton.styleFrom(
              primary: Colors.blueAccent,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Não'),
            style: TextButton.styleFrom(
              primary: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }

  void deleteAllTodos() {
    setState(() {
      todos.clear();
    });
    todoRepository.saveTodoList(todos);
  }
}
