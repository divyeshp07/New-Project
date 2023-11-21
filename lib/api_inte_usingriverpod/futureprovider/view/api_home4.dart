import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/api_inte_usingriverpod/futureprovider/provider/home4_provider.dart';

class Home4 extends ConsumerWidget {
  const Home4({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.amber,
      //   elevation: 0,
      //   centerTitle: true,
      //   title: Text('h4'),
      //   leading: FloatingActionButton.small(
      //       onPressed: () {}, child: Icon(Icons.arrow_back_ios_new)),
      // ),
      body: ref.watch(home4futureprovider).when(
            data: (data) => Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://images.pexels.com/photos/13766106/pexels-photo-13766106.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height / 3,
                        // color: Colors.white,
                      ),
                      // Positioned(
                      //   left: 50,
                      //   bottom: 50,
                      //   child: CircleAvatar(
                      //     radius: 95,
                      //     backgroundColor:
                      //         const Color.fromARGB(255, 193, 186, 186),
                      //     child: CircleAvatar(
                      //       backgroundColor:
                      //           const Color.fromARGB(255, 238, 214, 214),
                      //       radius: 80,
                      //       child: CircleAvatar(
                      //         radius: 60,
                      //         backgroundColor: Colors.white,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Positioned(
                          left: -40,
                          top: 60,
                          child: Column(
                            children: [
                              Container(
                                width: 170,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white.withOpacity(.3),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Icon(
                                      Icons.location_pin,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      data!.city.name.toString(),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontStyle: FontStyle.italic),
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                ' ⛅${(data.list[0].main.temp - 273).toStringAsFixed(2)}°C',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 80,
                                    color: Colors.black),
                              ),
                              Text(
                                data.city.country.toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Population:${data.city.population}',
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                ],
                              )
                            ],
                          ))
                    ],
                  ),
                  Text(
                    data.list[0].dtTxt.toString(),
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 105,
                    width: MediaQuery.sizeOf(context).width,
                    // color: Colors.red,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 20, left: 30),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(4.0, 4.0),
                                        blurRadius: 6.0,
                                      ),
                                    ],
                                    gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Colors.black38,
                                        Colors.black12,
                                      ],
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${data.list[index].dtTxt.hour.toString()}:${data.list[index].dtTxt.minute.toString()}${data.list[index].dtTxt.millisecond.toString()}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        const Icon(
                                          Icons.cloudy_snowing,
                                          size: 35,
                                        ),
                                        Text(
                                          '  ${data.list[index].dtTxt.month.toString()}/${data.list[index].dtTxt.day.toString()}/${data.list[index].dtTxt.year}',
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 410,
                    child: ListView.builder(
                      itemCount: data.list.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 3),
                        child: Card(
                          color: Colors.black.withOpacity(.2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(33)),
                          child: ListTile(
                            leading: FloatingActionButton.small(
                              onPressed: () {},
                              child:
                                  Text(data.list[index].dtTxt.day.toString()),
                            ),
                            title: Text(
                                'Pressure:${data.list[0].main.pressure.toString()}'),
                            subtitle: Text(
                              'Humidity:${data.list[0].main.humidity.toString()}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(
                              Icons.cloud_circle,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            error: (error, stackTrace) => Center(
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('try again')),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
