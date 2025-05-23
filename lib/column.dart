import 'package:flutter/material.dart';

class AlignExample extends StatelessWidget {
  const AlignExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Alignment Example")),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Dòng 1", style: TextStyle(fontSize: 20)),
            Text("Dòng 2", style: TextStyle(fontSize: 20)),
            Text("Dòng 3", style: TextStyle(fontSize: 20)),
          ],
        ),
      )
    );
  }
}