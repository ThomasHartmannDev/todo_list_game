import 'package:flutter/material.dart';
import 'package:todo_list_game/components/task.dart';
import 'package:todo_list_game/data/task_dao.dart';
import 'package:todo_list_game/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.task),
        actions: [IconButton(onPressed: (){setState((){});}, icon: const Icon(Icons.refresh))],
        title: const Text('Tarefas'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<Task>>(
            future: TaskDao().findAll(),
            builder: (context, snapshot) {
              List<Task>? items = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: Column(
                      children: const [
                        CircularProgressIndicator(),
                        Text('Carregando')
                      ],
                    ),
                  );

                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                      children: const [
                        CircularProgressIndicator(),
                        Text('Carregando')
                      ],
                    ),
                  );

                case ConnectionState.active:
                  return Center(
                    child: Column(
                      children: const [
                        CircularProgressIndicator(),
                        Text('Carregando')
                      ],
                    ),
                  );

                case ConnectionState.done:
                  if (snapshot.hasData && items != null) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Task task = items[index];
                            return task;
                          });
                    }
                    return Center(
                      child: Column(
                        children: const [
                          Icon(Icons.error_outline, size: 128),
                          Text(
                            'Não existe nenhuma tarefa',
                            style: TextStyle(fontSize: 32),
                          )
                        ],
                      ),
                    );
                  }
                  return const Text('Erro ao carregar tarefas');

              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
          ).then((value) => setState((){}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
