import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String userName;

  const HomeScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thông tin người dùng')),
      body: Center(
        child: Column(
          children: [
            Text(
              'Xin chào: $userName',
              style: const TextStyle(fontSize: 20),
            ),
            Image.network(
              'https://picsum.photos/200',
              height: 200,
              width: 300,
            ),
            Container(
            )
          ],
        )
        
      ),
    );
  }
}