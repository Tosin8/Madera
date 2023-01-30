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
    double displayWidth = MediaQuery.of(context).size.width;
    // final contactBook = ContactBook();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contact Book'),
          centerTitle: true,
        ),
        body: ValueListenableBuilder(
            valueListenable: ContactBook(),
            builder: (contact, value, child) {
              final contacts = value;
              return ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    final contact = contacts[index];
                    return Dismissible(
                      // widgets to dismiss cells.i.e to Removing Contacts.
                      onDismissed: (direction) {
                        ContactBook().remove(contact: contact);
                      },
                      key: ValueKey(contact.id),
                      child: Material(
                        color: Colors.white,
                        elevation: 6.0,
                        child: ListTile(
                          title: Text(contact.name),
                        ),
                      ),
                    );
                  });
            }),

        // using floating action button press, send user to NewContactView.

        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.of(context).pushNamed('/new-contact');
          },
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: Container(
            margin: EdgeInsets.all(displayWidth * .65),
            height: displayWidth * .155,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                )
              ],
              borderRadius: BorderRadius.circular(50),
            ),
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
              itemBuilder: (context, index) => InkWell(
                onTap: () {},
              ),
            )));
  }
}
