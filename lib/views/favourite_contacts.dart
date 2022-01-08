import 'dart:math';

import 'package:contact_app/data/contacts_json.dart';
import 'package:contact_app/models/contact.dart';
import 'package:flutter/material.dart';

class FavouriteContacts extends StatelessWidget {
  const FavouriteContacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 80, top: 10),
          child: Center(
            child: Wrap(
              children: [
                ...allContacts.sublist(15, 20).map(
                  (e) {
                    final Contact contact = Contact.fromJson(e);
                    int randomNumber = Random().nextInt(10);
                    return SizedBox(
                      // width: (MediaQuery.of(context).size.width / 2) - 10,
                      width: 170,
                      child: Card(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                icon: const Icon(Icons.more_vert),
                                onPressed: () {},
                              ),
                            ),
                            CircleAvatar(
                              child: Text("${contact.firstName[0]} "),
                              radius: 30,
                              backgroundColor: randomColors[randomNumber],
                            ),
                            const SizedBox(height: 10),
                            Text("${contact.firstName} ${contact.lastName}"),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
