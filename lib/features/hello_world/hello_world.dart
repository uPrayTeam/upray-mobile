import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HelloWorld extends StatefulWidget {
  const HelloWorld({super.key});

  @override
  State<HelloWorld> createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello World !!!',
          style: TextStyle(fontSize: 80.0),
        ),
      ),
    );
  }
}
