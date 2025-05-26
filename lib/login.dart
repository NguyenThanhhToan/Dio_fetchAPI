import 'package:basic_app/router/app_route.dart';
import 'package:basic_app/service/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'button.dart';
import 'stack.dart';

class NameInputScreen extends StatelessWidget {
  const NameInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Your Name'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          FloatingElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StackExample(),
                ),
              );
            },
            bottom: 350,
            right: 100,
          ),
          const Center(child: NameInputField()),
        ],
      ),
    );
  }
}

class NameInputField extends StatefulWidget {
  const NameInputField({super.key});

  @override
  State<NameInputField> createState() => _NameInputFieldState();
}

class _NameInputFieldState extends State<NameInputField> {
  final TextEditingController _nameController = TextEditingController();
  final userService = Get.find<UserService>();

  @override
  void dispose(){
    _nameController.dispose();
    super.dispose();
  }

  void _submitName() {
    String name = _nameController.text.trim();
    if (name.isNotEmpty) {
      userService.login(name);
      Get.toNamed(AppRoutes.homeScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(26.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: _nameController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Enter your name',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () => _submitName(),
            icon: const Icon(Icons.send),
            label: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}

