import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class StremExample extends StatefulWidget {
  const StremExample({super.key});

  @override
  State<StremExample> createState() => _StremExampleState();
}

class _StremExampleState extends State<StremExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Streams"),
      ),
    );
  }
}
