import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/models/todo.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({
    Key? key,
    required this.todo,
    required this.onDelete,
  }) : super(key: key);

  final Todo todo;
  final Function(Todo) onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Slidable(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xff121212),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                DateFormat('dd/MM/yyyy - hh:mm').format(todo.date),
                style: TextStyle(
                  color: Color(0xffa7a6a6),
                  fontSize: 12,
                ),
              ),
              Text(
                todo.title,
                style: TextStyle(
                  color: Color(0xffeeeeee),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        actionPane: const SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        actions: [
          IconSlideAction(
            icon: Icons.check,
            color: Colors.blue,
            caption: 'Concluir',
            onTap: () {},
          )
        ],
        secondaryActions: [
          IconSlideAction(
            icon: Icons.delete,
            color: Colors.red,
            caption: 'Deletar',
            onTap: () {
              onDelete(todo);
            },
          ),
          IconSlideAction(
            icon: Icons.edit,
            color: Colors.green,
            caption: 'Editar',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
