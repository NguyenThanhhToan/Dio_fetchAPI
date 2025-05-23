import 'package:flutter/material.dart';


class Screen1 extends StatefulWidget{
  final String name;
  const Screen1({super.key, required this.name});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  int counter = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen 1"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 100),
          Center(
            child: Text("counter $counter.toString()", style: const TextStyle(fontSize: 20)),
          ),
          Text(widget.name, style: const TextStyle(fontSize: 20)),
        ]
      ),
    );
  }
}

class My extends StatefulWidget{
  const My({super.key});

  @override
  State<StatefulWidget> createState() => _My();
}

class _My extends State<My> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class AA extends StatefulWidget{
  const AA({super.key});

  @override
  State<StatefulWidget> createState() => _AA();

}

class _AA extends State<AA>{
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}