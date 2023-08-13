import 'package:flutter/material.dart';

class MyFirstWidget extends StatelessWidget {
  const MyFirstWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container
      (
      color: Colors.black12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(color: Colors.red, width: 100, height: 100,),
              Container(color: Colors.orange, width: 100, height: 100,),
              Container(color: Colors.yellow, width: 100, height: 100,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(color: Colors.green, width: 100, height: 100,),
              Container(color: Colors.cyan, width: 100, height: 100,),
              Container(color: Colors.blue, width: 100, height: 100,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(color: Colors.purple, width: 100, height: 100,),
              Container(color: Colors.pinkAccent, width: 100, height: 100,),
              Container(color: Colors.white, width: 100, height: 100,),
            ],
          )
        ],
      )
      ,
    );
  }
}
