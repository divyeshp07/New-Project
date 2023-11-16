import 'package:flutter/material.dart';
import 'package:state_managment/api_integration/services/service_4.dart';

class Api4 extends StatefulWidget {
  const Api4({super.key});

  @override
  State<Api4> createState() => _Api4State();
}

class _Api4State extends State<Api4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('api 4'),
      ),
      body: FutureBuilder(
          future: Apiservice4.getPosts(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data == null) {
              return Center(
                child: Column(
                  children: [
                    Text('something wrangg'),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            Apiservice4();
                          });
                        },
                        icon: Icon(Icons.refresh))
                  ],
                ),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  leading: Column(
                    children: [
                      CircleAvatar(
                        child: Text('${snapshot.data![index].userId}'),
                      ),
                      Text('${snapshot.data![index].iD}')
                    ],
                  ),
                  title: Text('${snapshot.data![index].title}'),
                  subtitle: Text('${snapshot.data![index].body}'),
                ),
              ),
            );
          }),
    );
  }
}
