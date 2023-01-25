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
// Using ValueNotifier : To notify HomePage about changes to Contact Book.

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final contactBook = ContactBook();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contact Book'),
          centerTitle: true,
        ),
        body: ValueListenableBuilder(
            valueListenable: ContactBook(),
            builder: (contact, value, child) {
              final contacts = value as List<Contact>;
              return ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    final contact = contacts[index];
                    return ListTile(
                      title: Text(contact.name),
                    );
                  });
            }),

        // using floating action button press, send user to NewContactView.

        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.of(context).pushNamed('/new-contact');
          },
          child: const Icon(Icons.add),
        ));
  }
}
