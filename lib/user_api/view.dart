import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/user_api/provider.dart';

class UserDetails extends ConsumerWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.pentagon),
        ),
        title: const Text('employees'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.favorite))],
      ),
      body: ref.watch(userdetailsProvider).when(
            data: (data) => ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) => SizedBox(
                child: Column(
                  children: [
                    Card(
                      child: ListTile(
                        trailing: IconButton(
                            onPressed: () {}, icon: Icon(Icons.favorite)),
                        leading: CircleAvatar(
                          child: Text(data[index].id.toString()),
                        ),
                        title: Text(data[index].name.toString()),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data[index].email,
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(data[index].phone,
                                style: TextStyle(color: Colors.green)),
                            Text(data[index].username,
                                style: TextStyle(color: Colors.yellow)),
                            Text(data[index].website,
                                style: TextStyle(color: Colors.blue)),
                            Text(data[index].company.toString(),
                                style: TextStyle(color: Colors.purple)),
                            Text(data[index].id.toString(),
                                style: TextStyle(color: Colors.white)),
                            Text(data[index].address.toString(),
                                style: TextStyle(color: Colors.black)),
                            Text(data[0].company.name),
                            Text(data[0].address.city),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            error: (error, stackTrace) => const Center(child: Text('error')),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
