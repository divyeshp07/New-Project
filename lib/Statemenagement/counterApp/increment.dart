import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/Statemenagement/counterApp/decrement.dart';
import 'package:state_managment/Statemenagement/provider/provider.dart';

class increment extends ConsumerWidget {
  increment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.listen(counter, ((previous, next) {
    //   if (next == 3) {
    //     ScaffoldMessenger.of(context)
    //         .showSnackBar(SnackBar(content: Text("the value is $next")));
    //   }
    // }));
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              // ignore: unused_result
              ref.refresh(counter.notifier);
            },
            icon: Icon(Icons.restore)),
        title: const Text("increment"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const decrement()),
                );
              },
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.red,
                size: 30,
              ))
        ],
      ),
      body: Center(
        child: Text(
          ref.watch(counter).toString(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ref.read(counter.notifier).state++;
        },
        label: const Text("Add"),
      ),
    );
  }
}
