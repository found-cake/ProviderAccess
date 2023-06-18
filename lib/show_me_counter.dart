import 'package:flutter/material.dart';
import 'package:learn/counter.dart';
import 'package:provider/provider.dart';

class ShowMeCounter extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter")
      ),
      body: Center(
        child: Text(
          "${context.watch<Counter>().counter}",
          style: TextStyle(fontSize: 52),
        ),
      ),
    );
  }
}