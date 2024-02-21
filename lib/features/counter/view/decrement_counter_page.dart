import 'package:flutter/material.dart';

class DecrementCounterPage extends StatefulWidget {
  final int count;
  final VoidCallback decrementCount;
  const DecrementCounterPage({
    super.key,
    required this.count,
    required this.decrementCount,
  });

  @override
  State<DecrementCounterPage> createState() => _DecrementCounterPageState();
}

class _DecrementCounterPageState extends State<DecrementCounterPage> {
  @override
  Widget build(BuildContext context) {
    print("Build 3");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Decrement Counter"),
      ),
      body: Center(
        child: Text(
          "Count: ${widget.count}",
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.decrementCount();
        },
        child: const Icon(Icons.remove),
      ),
    );
  }
}
