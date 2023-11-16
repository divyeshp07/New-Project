import 'package:flutter/material.dart';
import 'package:state_managment/api_integration/services/services_2.dart';

class HomePage1 extends StatelessWidget {
  const HomePage1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Integration"),
      ),
      body: FutureBuilder(
          future: ApiServices.getAllPosts(),
          builder: (BuildContext context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                  // child: CircularProgressIndicator(),
                  );
            }
            if (snapshot.data == null) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Somthing went wrong please retry"),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.refresh),
                    ),
                  ],
                ),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text("${snapshot.data![index].userId}"),
                  ),
                  title: Text(snapshot.data![index].title),
                  subtitle: Text(snapshot.data![index].body),
                ),
              ),
            );
          }),
    );
  }
}
