import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  final String? name;
  const FirstPage({super.key, this.name});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("First Page")),
      body: Column(
        children: [
          Text("Hello, ${widget.name}"),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Pop"))
        ],
      ),
    );
  }
}
