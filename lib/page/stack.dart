import 'package:flutter/material.dart';

class StackExample extends StatefulWidget{
  const StackExample ({super.key,});
  @override
  State<StatefulWidget> createState() => _StackExample();
}

class _StackExample extends State<StackExample>{
  @override
  Widget build(BuildContext context) {
    bool showCircle = true;
    return Scaffold(
      appBar: AppBar(title: const Text("Stack")),
      body: Stack(
          children: [
            Container(
              color: Colors.red,
              width: 200,
              height: 100,
            ),
            if (showCircle)
              Positioned(
                top: 0,
                right: 80,
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                ),
              ),
            const Text(
              'Stack Text',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showCircle = !showCircle;
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}