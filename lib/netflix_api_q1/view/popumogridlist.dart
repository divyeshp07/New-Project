import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/netflix_api_q1/movie_provider.dart';
import 'package:state_managment/netflix_api_q1/movie_url.dart';
import 'package:state_managment/netflix_api_q1/view/moviecardinnerview.dart';

class PopuMoGridlist extends ConsumerWidget {
  const PopuMoGridlist({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 81,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 40,
            )),
        centerTitle: true,
        title: const Text(
          'Popular Movies',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: ref.watch(PopularProvider).when(
            data: (data) {
              if (data == null) {
                return const Center(
                  child: Text('something wraaangg'),
                );
              }
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 13.9,
                  crossAxisSpacing: 12.09,
                  childAspectRatio: .7,
                ),
                itemCount: data.results.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const MoviecardInnerView(),
                              )),
                          child: Container(
                            width: 160,
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(MovieUrl.imageUrl +
                                      data.results[index].backdropPath
                                          .toString()),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                                trailing: FloatingActionButton.small(
                              onPressed: () {},
                              child: Icon(Icons.favorite),
                            )),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          data.results[index].title,
                          maxLines: 2, // Adjust the number of lines as needed
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            error: (error, stackTrace) => const Center(
              child: Text('error try again'),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
