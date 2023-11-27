import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/api_inte_usingriverpod/futureprovider/provider/iphonestore_provider.dart';

class IphoneStore extends ConsumerWidget {
  const IphoneStore({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.bar_chart_rounded,
                size: 35,
              ))
        ],
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 25,
            )),
        centerTitle: true,
        title: RichText(
          text: const TextSpan(
              text: 'i',
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              children: [
                TextSpan(
                    text: ' Cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ))
              ]),
        ),
      ),
      body: ref.watch(iphonestoreProvider).when(
            data: (data) {
              if (data == null) {
                return const Center(
                  child: Text('somthing wrangg'),
                );
              }
              return ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 40,
                ),
                itemCount: data.products.length,
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                        top: 8,
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: 300,
                            // color: Colors.black,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    data.products[index].images[0].toString()),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        data.products[index].brand,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            backgroundColor: Colors.black54),
                                      ),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.favorite,
                                          size: 30,
                                        ))
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          padding: const EdgeInsets.all(0)),
                                      onPressed: () {},
                                      child: const Icon(
                                        Icons.shopify_rounded,
                                        color: Colors.black,
                                        size: 35,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          padding: const EdgeInsets.all(0)),
                                      onPressed: () {},
                                      child: const Icon(
                                        Icons.shopping_cart_checkout,
                                        size: 35,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              right: 20,
                              bottom: 10,
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.yellow,
                                    radius: 55,
                                    child: Text(
                                      ' ${data.products[index].discountPercentage.toString()}%',
                                      style: const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              )),
                          Positioned(
                            right: 10,
                            bottom: -5,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 30,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Offer',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        data.products[index].rating.toString(),
                                        style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.grey.shade800,
                                        size: 13,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      data.products[index].title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      data.products[index].description,
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        data.products[index].price.toString(),
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                        width: 200,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange),
                          child: const Text(
                            'Buy Now',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontStyle: FontStyle.italic),
                          ),
                        ))
                  ],
                ),
              );
            },
            error: (error, stackTrace) => Center(
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.restart_alt)),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      bottomNavigationBar:
          CurvedNavigationBar(color: Colors.white, items: const [
        Icon(
          Icons.favorite,
          color: Colors.red,
        ),
        Icon(
          Icons.favorite,
          color: Colors.green,
        ),
        Icon(Icons.favorite, color: Colors.blue),
      ]),
      extendBody: true,
    );
  }
}
