import 'package:flutter/material.dart';
import 'package:state_managment/api_integration/services/services_2.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text("Home Page"),
      ),
      body: FutureBuilder(
          future: ApiServices.getAllPosts(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data == null) {
              return Center(
                child: TextButton(
                  onPressed: () {
                    ApiServices.getAllPosts();
                  },
                  child: const Text("Something went wrong please retry"),
                ),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              itemBuilder: (context, index) {
                final data = snapshot.data![index];
                return Card(
                  color: const Color.fromARGB(255, 96, 87, 121),
                  child: ListTile(
                    title: Text(
                      data.title,
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      data.body,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
