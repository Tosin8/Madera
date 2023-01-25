import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Contact {
  // Creating Contact Class.
  final String name;
  final String id;
  Contact({required this.name}) : id = const Uuid().v4(); //constructor.
}

class ContactBook extends ValueNotifier<List<Contact>> {
  // Creating Contact Book, now converting it to ValueNotifier<list><Contact>> begins from extends.
  ContactBook._sharedInstance()
      : super(
            []); // private constructor, including super extension after valueNotifier conversion.
  static final ContactBook _shared = ContactBook._sharedInstance();
  factory ContactBook() => _shared;

  // Creating Contact Storage, using the list because of using a ListView.builder.
  final List<Contact> _contacts = [
    // const Contact(name: 'Foo Bar')
    // adding contacts manually , the code sample above.
  ];

  int get length => value
      .length; // exposing how many contacts to have., constructor changed from _contacts.lenght to value.lenght.

// Simple Add Function on Contact Book
  void add({required Contact contact}) {
    final contacts = value;
    contacts.add(contact);
    // value = contacts;
    notifyListeners();
    // updating 'add(...)' function to use value instead. Before, _contacts.add(contact)
  }

  // Simple Remove Function on Contact Book
  void remove({required Contact contact}) {
    //  _contacts.remove(contact);
    final contacts = value;
    if (contacts.contains(contact)) {
      contacts.remove(contact);
      notifyListeners();
    }
  }

  // A function to retrieve contacts with index
  Contact? contact({required int atIndex}) =>
//       _contacts.length > atIndex ? _contacts[atIndex] : null;
      value.length > atIndex ? value[atIndex] : null;
}
