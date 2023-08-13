import 'dart:async';
import 'package:flutter/material.dart';

//Broadcast Stream
class BroadcastStreamExample extends StatefulWidget {
  BroadcastStreamExample({super.key});

  @override
  State<BroadcastStreamExample> createState() => _BroadcastStreamExampleState();
}

class _BroadcastStreamExampleState extends State<BroadcastStreamExample> {
  late Stream<String> dataStream; // stream of data
  StreamController<String> streamController = StreamController<String>();

  @override
  void initState() {
    dataStream = streamController.stream.asBroadcastStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Streams"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Listner 1
          StreamBuilder<String>(
              stream: dataStream,
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "No data");
              }),
          TextField(
              onChanged: (value) {
                streamController.add(value); // listening data to stream
              },
              decoration: const InputDecoration(
                hintText: "Enter text here",
              )),
          // Listner 2
          StreamBuilder<String>(
              stream: dataStream,
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "No data");
              }),
        ],
      ),
    );
  }
}

//Single Stream
class SingleStreamExample extends StatelessWidget {
  SingleStreamExample({super.key});
  StreamController<String> dataStream = StreamController<String>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Streams"),
      ),
      body: StreamBuilder(
        stream: dataStream.stream,
        builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(snapshot.data ?? "No data"),
              TextField(
                  onChanged: (value) {
                    dataStream.add(value); // listening data to stream
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter text here",
                  ))
            ],
          );
        },
      ),
    );
  }
}
