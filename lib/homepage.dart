import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class StremExample extends StatefulWidget {
  const StremExample({super.key});

  @override
  State<StremExample> createState() => _StremExampleState();
}

class _StremExampleState extends State<StremExample> {
  StreamController<String> stringStream = StreamController();
  late Stream<String> dataStream;
  @override
  void initState() {
    // TODO: implement initState
    dataStream = stringStream.stream.asBroadcastStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Streams"),
        ),
        body: Column(
          children: [
            StreamBuilder<String>(
              stream: dataStream,
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "No data");
              },
            ),
            TextField(
              onChanged: (value) {
                stringStream.add(value);
              },
            ),
            StreamBuilder<String>(
              stream: dataStream,
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "No data");
              },
            ),
          ],
        ));
  }
}
