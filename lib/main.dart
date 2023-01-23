import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Contact Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class Contact {
  // Creating Contact Class.
  final String name;
  const Contact({required this.name}); //constructor.
}

class ContactBook {
  // Creating Contact Book.
  ContactBook._sharedInstance(); // private constructor
  static final ContactBook _shared = ContactBook._sharedInstance();
  factory ContactBook() => _shared;

  // Creating Contact Storage, using the list because of using a ListView.builder.
  final List<Contact> _contacts = [];

  int get length => _contacts.length; // exposing how many contacts to have.

// Simple Add Function on Contact Book
  void add({required Contact contact}) {
    _contacts.add(contact);
  }

  // Simple Remove Function on Contact Book
  void remove({required Contact contact}) {
    _contacts.remove(contact);
  }

  // A function to retrieve contacts with index
  Contact? contact({required int atIndex}) =>
      _contacts.length > atIndex ? _contacts[atIndex] : null;
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(),
    );
  }
}
