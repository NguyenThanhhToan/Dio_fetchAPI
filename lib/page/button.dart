import 'package:flutter/material.dart';

class FloatingElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final IconData icon;
  final double bottom;
  final double right;
  const FloatingElevatedButton({
    super.key,
    required this.onPressed,
    this.label = "Send",
    this.icon = Icons.send, required this.bottom, required this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      right: right,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: StadiumBorder(),
          elevation: 8,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        ),
      ),
    );
  }
}
