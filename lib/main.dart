import 'package:flutter/material.dart';

import 'components/contact_book_class.dart';
import 'components/new_contact.dart';

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
      routes: {
        '/new-contact': (context) => const NewContactView(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final contactBook = ContactBook();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: contactBook.length,
            itemBuilder: (context, index) {
              final contact = contactBook.contact(atIndex: index)!;
              return ListTile(
                title: Text(contact.name),
              );
            }),

        // using floating action button press, send user to NewContactView.
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/new-contact');
          },
          child: const Icon(Icons.add),
        ));
  }
}
