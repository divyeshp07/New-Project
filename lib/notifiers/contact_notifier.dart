import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/model/contact_model.dart';

class ContactNotifier extends StateNotifier<List<ContactModel>> {
  ContactNotifier() : super([]);

  void addContact(ContactModel contact1) {
    state = [...state, contact1];
  }

  void deleteContact(int index) {
    state = [
      for (ContactModel contact1 in state)
        if (contact1 != state[index]) contact1
    ];
  }

  void fav(int index, ContactModel contact) {
    state = [
      for (ContactModel contact1 in state)
        if (contact1 != state[index]) contact1 else contact
    ];
  }

  void call(int index, ContactModel contactcall) {
    state = [
      for (ContactModel contact1 in state)
        if (contact1 != state[index]) contact1 else contactcall
    ];
  }
}
