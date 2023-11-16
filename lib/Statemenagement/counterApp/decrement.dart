import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dar';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/Statemenagement/provider/provider.dart';

class decrement extends ConsumerWidget {
  const decrement({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              // ignore: unused_result
              ref.refresh(counter.notifier);
            },
            icon: Icon(Icons.restore)),
        title: const Text("decrement"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.abc),
          ),
        ],
      ),
      body: Center(child: Consumer(builder: (context, ref, child) {
        return Text(
          ref.watch(counter).toString(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        );
      })),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ref.read(counter.notifier).state--;
        },
        label: const Text("Less"),
      ),
    );
  }
}
