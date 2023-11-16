import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/model/pan_model.dart';
import 'package:state_managment/provider/pan_card_provider.dart';

class PanScreen extends ConsumerWidget {
  PanScreen({super.key});
  TextEditingController pannumber = TextEditingController();
  TextEditingController updatenum = TextEditingController();
  TextEditingController panname = TextEditingController();
  TextEditingController pandate = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Create YourOwn PAN'),
        leading: const Icon(Icons.account_balance_outlined),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          for (int i = 1; i < ref.watch(panProvider).length; i++) ...[
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.amber),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ref.watch(panProvider)[i].pannum.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 23),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Text(
                        ref.watch(panProvider)[i].name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(ref.watch(panProvider)[i].date.toString())
                      // ]
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton.small(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Center(child: Text('Eter the pan number')),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: pannumber,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          color: Colors.blue))),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            FloatingActionButton.extended(
                              onPressed: () {
                                ref.read(panProvider.notifier).panNumAdd(
                                      PanModel(
                                          pannum: int.parse(pannumber.text),
                                          name: "name",
                                          date: DateTime.now()),
                                    );
                                pannumber.clear();
                                Navigator.pop(context);
                              },
                              label: const Text('Submit'),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  child: const Icon(Icons.add),
                ),
                CircleAvatar(
                  radius: 30,
                  child: FloatingActionButton.small(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Center(child: Text('Edit the PAN num')),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                controller: updatenum,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: Colors.blue))),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              FloatingActionButton.extended(
                                onPressed: () {
                                  ref.read(panProvider.notifier).state;
                                  updatenum.clear();
                                  Navigator.pop(context);
                                },
                                label: const Text('submit'),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    child: const Icon(Icons.edit),
                  ),
                ),
                FloatingActionButton.small(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title:
                            const Center(child: Text('Edit persional details')),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                  label: const Text('name'),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          color: Colors.blue))),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: pandate,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  label: const Text('date'),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          color: Colors.blue))),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            FloatingActionButton.extended(
                              onPressed: () {
                                pandate.clear();
                                Navigator.pop(context);
                              },
                              label: const Text('submit'),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  child: const Icon(Icons.person),
                )
              ],
            )
          ],
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.delete),
      ),
    );
  }
}
