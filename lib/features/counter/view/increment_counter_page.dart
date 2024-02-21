import 'package:flutter/material.dart';
import 'package:state_management_tutorial/features/counter/view/decrement_counter_page.dart';

class IncrementCounterPage extends StatefulWidget {
  final int count;
  final VoidCallback incrementCount;
  final VoidCallback decrementCount;
  const IncrementCounterPage({
    super.key,
    required this.count,
    required this.incrementCount,
    required this.decrementCount,
  });

  @override
  State<IncrementCounterPage> createState() => _IncrementCounterPageState();
}

class _IncrementCounterPageState extends State<IncrementCounterPage> {
  @override
  Widget build(BuildContext context) {
    print("Build 2");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Increment Counter"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return DecrementCounterPage(
                    count: widget.count,
                    decrementCount: widget.decrementCount,
                  );
                },
              ));
            },
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Count: ${widget.count}",
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.incrementCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
