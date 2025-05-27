import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/authController.dart';


class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Your Name'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // FloatingElevatedButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const StackExample(),
          //       ),
          //     );
          //   },
          //   bottom: 350,
          //   right: 100,
          // ),
          Center(child: LoginInputField()),
        ],
      ),
    );
  }
}
class LoginInputField extends StatelessWidget {
  const LoginInputField({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Padding(
      padding: const EdgeInsets.all(26.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            onChanged: (v) => authController.userName.value = v,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            onChanged: (p) => authController.password.value = p,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: authController.handleLogin,
            icon: const Icon(Icons.send),
            label: const Text('Login'),
          ),
        ],
      ),
    );
  }
}

