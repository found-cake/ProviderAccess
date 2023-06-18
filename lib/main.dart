import 'package:flutter/material.dart';
import 'package:learn/counter.dart';
import 'package:learn/show_me_counter.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Counter _counter = Counter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      routes: {
        "/": (context) => ChangeNotifierProvider.value(
          value: _counter,
          child: MyHomePage(),
        ),
        "/counter": (context) => ChangeNotifierProvider.value(
          value: _counter,
          child: ShowMeCounter(),
        ),
      },
    );
  }

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }
}

class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text(
                "Show Me Counter",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () => Navigator.pushNamed(context, 'counter')
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              child: Text(
                "Increment Counter",
                style: TextStyle(fontSize: 20,),
              ),
              onPressed: () => context.read<Counter>().increment(),
            )
          ],
        ),
      ),
    );
  }
}