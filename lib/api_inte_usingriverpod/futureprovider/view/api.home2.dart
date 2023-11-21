import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/api_inte_usingriverpod/futureprovider/provider/home2_provider.dart';

class home2 extends ConsumerWidget {
  const home2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('api using provider 2'),
      ),
      body: ref.watch(home2FutureProvider).when(
            data: (data) => ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text('Name:${data[index].name}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email: ${data[index].email}',
                      ),
                      Text(
                        data[index].body,
                      ),
                    ],
                  ),
                  leading: Column(
                    children: [
                      CircleAvatar(
                        child: Text(data[index].id.toString()),
                      ),
                      Text('id')
                    ],
                  ),
                  trailing: TextButton(
                      onPressed: () {},
                      child: Text(data[index].postId.toString())),
                ),
              ),
            ),
            error: (error, stackTrace) => Center(
              child: Text('error'),
            ),
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
