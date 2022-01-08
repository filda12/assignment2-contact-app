import 'dart:math';

import 'package:contact_app/data/contacts_json.dart';
import 'package:contact_app/models/contact.dart';
import 'package:flutter/material.dart';

class AllContacts extends StatelessWidget {
  const AllContacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Contact> sortedContacts =
        allContacts.map((e) => Contact.fromJson(e)).toList();
    sortedContacts.sort((a, b) => a.firstName.compareTo(b.firstName));
    // ScrollController scrollController = ScrollController();

    // scrollController.

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("My Profile"),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                ),
              ),
              Divider(
                thickness: 5,
                color: Colors.grey.withOpacity(0.1),
              ),
              ListTile(
                leading: const SizedBox(),
                title: Row(
                  children: const [
                    CircleAvatar(
                      child: Icon(Icons.person_add_alt_1),
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.blue,
                    ),
                    SizedBox(width: 20),
                    Text("Create new contact"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ]),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                Contact contact = sortedContacts[index];
                int randomNumber = Random().nextInt(10);
                return ListTile(
                  leading: Text(
                    contact.firstName[0],
                    style: const TextStyle(
                      color: Colors.teal,
                      fontSize: 20,
                    ),
                  ),
                  title: Row(
                    children: [
                      CircleAvatar(
                        child: Text(contact.firstName[0]),
                        backgroundColor: randomColors[randomNumber],
                      ),
                      const SizedBox(width: 20),
                      Text("${contact.firstName} ${contact.lastName}"),
                    ],
                  ),
                );
              },
              childCount: sortedContacts.length,
              addAutomaticKeepAlives: true,
            ),
          ),
        ],
      ),
    );
  }
}
