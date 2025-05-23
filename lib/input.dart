import 'package:flutter/material.dart';
import 'home.dart';
import 'button.dart';
import 'screen1.dart';
import 'columm.dart';

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
                  builder: (context) => const AlignExample(),
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
  String _enteredName = '';

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_updateName);
  }

  void _updateName() {
    setState(() {
      _enteredName = _nameController.text;
    });
  }

  @override
  void dispose() {
    _nameController.removeListener(_updateName);
    _nameController.dispose();
    super.dispose();
  }

  void _submitName(String username) {
    final name = username.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your name.')),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(userName: name),
        ),
      );
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
            obscuringCharacter: "?",
            textAlign: TextAlign.start,
            decoration: const InputDecoration(
              labelText: 'Enter your name',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Entered Name: $_enteredName',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () => _submitName(_nameController.text),
            icon: const Icon(Icons.send),
            label: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}

