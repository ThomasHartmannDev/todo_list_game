import 'package:flutter/material.dart';
import 'package:todo_list_game/components/difficulty.dart';
import 'package:todo_list_game/data/task_dao.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  Task(this.nome, this.foto, this.dificuldade, {Key? key})
      : super(key: key);
  int nivel = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {


  bool assetOrNetwork() {
    if (widget.foto.contains('http')) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: Colors.blue),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black26),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: assetOrNetwork()
                              ? Image.asset(widget.foto, fit: BoxFit.cover)
                              : Image.network(widget.foto, fit: BoxFit.cover)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: const TextStyle(
                                  fontSize: 24,
                                  overflow: TextOverflow.ellipsis),
                            )),
                        Difficulty(level: widget.dificuldade),
                      ],
                    ),
                    SizedBox(
                      width: 52,
                      height: 52,
                      child: ElevatedButton(
                          onLongPress: (){
                            TaskDao().delete(widget.nome);
                          },
                          onPressed: () {
                            setState(() {
                              widget.nivel++;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Icon(Icons.arrow_drop_up),
                              Text(
                                'Up',
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: (widget.dificuldade > 0)
                              ? (widget.nivel / widget.dificuldade) / 10
                              : 1,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Nivel: ${widget.nivel}',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
