import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/api_inte_usingriverpod/futureprovider/provider/home1_provider.dart';

class Home1 extends ConsumerWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('API Provider Screen'),
      ),
      body: ref.watch(home1FutureProvider).when(
            data: (data) {
              if (data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) => Card(
                      child: ListTile(
                        title: Text(data[index].title!),
                        subtitle: Text(data[index].body!),
                        leading: CircleAvatar(
                            child: Text(data[index].id!.toString())),
                        trailing: CircleAvatar(
                          child: Text(data[index].userId!.toString()),
                        ),
                      ),
                    ),
                  ),
                );
              }
            },
            error: (error, stackTrace) => Center(
              child: Text('Error: $error'),
            ),
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}







  // body: FutureBuilder(
      //     future: Apiservice4.getPosts(),
      //     builder: (context, snapshot) {
      //       if (!snapshot.hasData) {
      //         return const Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       }
      //       if (snapshot.data == null) {
      //         return Center(
      //           child: Column(
      //             children: [
      //               Text('something wrangg'),
      //               IconButton(
      //                   onPressed: () {
      //                     setState(() {
      //                       Apiservice4();
      //                     });
      //                   },
      //                   icon: Icon(Icons.refresh))
      //             ],
      //           ),
      //         );
      //       }
      //       return ListView.builder(
      //         itemCount: snapshot.data?.length,
      //         itemBuilder: (context, index) => Card(
      //           child: ListTile(
      //             leading: Column(
      //               children: [
      //                 CircleAvatar(
      //                   child: Text('${snapshot.data![index].userId}'),
      //                 ),
      //                 Text('${snapshot.data![index].iD}')
      //               ],
      //             ),
      //             title: Text('${snapshot.data![index].title}'),
      //             subtitle: Text('${snapshot.data![index].body}'),
      //           ),
      //         ),
      //       );
      //     }),