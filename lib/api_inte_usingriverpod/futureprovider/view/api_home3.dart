import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/api_inte_usingriverpod/futureprovider/provider/home3_provider.dart';

class home3 extends ConsumerWidget {
  const home3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('home 3 screen'),
        ),
        body: ref.watch(home3FutureProvider).when(
              data: (data) => ListView.builder(
                itemCount: data!.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Container(
                      child: ListTile(
                        title: Text(data[index].name,
                            style:
                                TextStyle(color: Colors.white, fontSize: 22)),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data[index].email,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                            Text(data[index].id.toString()),
                            Text(data[index].postId.toString()),
                            Text(data[index].body.toString()),
                          ],
                        ),
                        leading: CircleAvatar(
                          radius: 25,
                          child: Text(data[index].postId.toString()),
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {},
                          child: Text(data[index].postId.toString()),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              error: (error, stackTrace) => Center(
                child:
                    ElevatedButton(onPressed: () {}, child: Text('try again')),
              ),
              loading: () => Center(
                child: CircularProgressIndicator(),
              ),
            ));
  }
}
