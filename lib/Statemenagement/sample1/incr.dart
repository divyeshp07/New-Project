import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/Statemenagement/sample1/decr.dart';
import 'package:state_managment/Statemenagement/sample1/providers1.dart';

class incr extends ConsumerWidget {
  incr({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => decr(),
                    ));
              },
              icon: Icon(Icons.arrow_forward_rounded))
        ],
      ),
      body: Center(child: Text(ref.watch(user).toString())),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(user.notifier).state++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
