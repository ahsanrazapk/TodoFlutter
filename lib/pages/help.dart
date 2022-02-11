import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajuda'),
        backgroundColor: Color(0xff121212),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                texto(
                  'Para adicionar um novo item à lista, toque no icone "+" localizado em sua appbar, e então você será redirecionado(a) para preencher os campos',
                ),
                SizedBox(
                  height: 16,
                ),
                AppBar(
                  title: Text('Minhas Tarefas'),
                  backgroundColor: Color(0xff121212),
                  leading: Builder(
                    builder: (context) => IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.menu),
                    ),
                  ),
                  actions: [
                    IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        )),
                    IconButton(onPressed: () {}, icon: Icon(Icons.add))
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                texto(
                  'Para editar ou apagar um item, arraste-o para a esquerda, e então toque na opção desejada',
                ),
                SizedBox(
                  height: 16,
                ),
                item(),
                SizedBox(
                  height: 16,
                ),
                texto(
                    'Para marcar um item como finalizado, arraste-o para direita e toque no ícone "Concluir"'),
                SizedBox(
                  height: 16,
                ),
                item(),
                SizedBox(
                  height: 16,
                ),
                Center(
                  child: texto('App desenvolvido com <3 em Flutter/Dart'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget texto(String t) {
  return Text(
    t,
    style: TextStyle(color: Colors.white, fontSize: 12),
  );
}

Widget item() {
  return Slidable(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0xff121212),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Text(
            '10/02/2022 - 23:30',
            style: TextStyle(
              color: Color(0xffa7a6a6),
              fontSize: 12,
            ),
          ),
          Text(
            'Estudar',
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
    actions: const [
      IconSlideAction(
        icon: Icons.check,
        color: Colors.blue,
        caption: 'Concluir',
      )
    ],
    secondaryActions: const [
      IconSlideAction(
        icon: Icons.delete,
        color: Colors.red,
        caption: 'Deletar',
      ),
      IconSlideAction(
        icon: Icons.edit,
        color: Colors.green,
        caption: 'Editar',
      ),
    ],
  );
}
