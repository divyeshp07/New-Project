import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/model/contact_model.dart';
import 'package:state_managment/provider/contact_list_provider.dart';

class ContactList extends ConsumerWidget {
  ContactList({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final bool isChecked = false;
  final bool iscall = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("contacts"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: ref.watch(contactNotifierProvider).length,
        itemBuilder: (context, index) {
          final contact = ref.watch(contactNotifierProvider)[index];
          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contact.name,
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  contact.phonenum,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
            leading: IconButton(
                onPressed: () {
                  ref.read(contactNotifierProvider.notifier).call(
                        index,
                        ContactModel(
                            name: contact.name,
                            phonenum: contact.phonenum,
                            isFav: contact.isFav,
                            isCall: !contact.isCall),
                      );
                },
                icon: ref.watch(contactNotifierProvider)[index].isCall
                    ? const Icon(
                        Icons.call,
                        color: Colors.green,
                      )
                    : const Icon(Icons.call)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    ref.read(contactNotifierProvider.notifier).fav(
                          index,
                          ContactModel(
                              name: contact.name,
                              phonenum: contact.phonenum,
                              isFav: !contact.isFav,
                              isCall: contact.isCall),
                        );
                  },
                  icon: ref.watch(contactNotifierProvider)[index].isFav
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(Icons.favorite),
                ),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    ref
                        .read(contactNotifierProvider.notifier)
                        .deleteContact(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              child: Column(
                children: [
                  const Text(
                    'Add contacts here',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      label: Text('Name'),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        // borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      label: Text('Enter phone number'),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        // borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: 100,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            final name = nameController.text.toString();
                            final phone = phoneController.text.toString();
                            ref
                                .read(contactNotifierProvider.notifier)
                                .addContact(ContactModel(
                                    name: name,
                                    phonenum: phone,
                                    isFav: false,
                                    isCall: false));

                            Navigator.pop(context);
                            nameController.clear();
                            phoneController.clear();
                          },
                          child: const Text(
                            'Save',
                            style: TextStyle(fontSize: 20),
                          )))
                ],
              ),
            ),
          );
        },
        label: const Text("Add contacts"),
      ),
    );
  }
}
