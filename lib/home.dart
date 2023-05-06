import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List tarefas = ['Estudar', 'Ir para academia', 'Dormir'];
  TextEditingController _tituloTarefa =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDoList'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(itemCount: tarefas.length, itemBuilder: (context, index) {
          return ListTile(
            title: Text(tarefas[index]),
            trailing: IconButton(onPressed: () {
              setState(() {
                tarefas.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Deletado'),
                  duration: Duration(seconds:5),
                  ),
              );
            },
            icon: Icon(Icons.delete),
            ),
          );
        },),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        height: 40,
        shape: CircularNotchedRectangle(),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {
           showDialog(context: context, builder: (context){
                return AlertDialog(
                  title: Text('Adicionar tarefa'),
                  content: TextField(
                    controller: _tituloTarefa,
                  ),
                  actions: [
                    ElevatedButton(onPressed: () {
                      setState(() {
                        tarefas.add(_tituloTarefa.text);
                        _tituloTarefa.clear();
                      });
                      Navigator.pop(context);
                    }, child: Text('Adicionar',)),
                    ElevatedButton(onPressed: () {
                      Navigator.pop(context);
                        _tituloTarefa.clear();
                    }, child: Text('Cancelar',)),
                  ],
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}