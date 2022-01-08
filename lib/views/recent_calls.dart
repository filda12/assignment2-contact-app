import 'package:contact_app/data/contacts_json.dart';
import 'package:contact_app/models/contact.dart';
import 'package:contact_app/widget/call_history.dart';
import 'package:flutter/material.dart';

class RecentCalls extends StatelessWidget {
  const RecentCalls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                "TODAY",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ...allContacts.sublist(1, 4).map((e) {
              Contact contact = Contact.fromJson(e);
              return CallHistoryItem(contact: contact);
            }).toList(),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                "YESTERDAY",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ...allContacts.sublist(10, 15).map((e) {
              Contact contact = Contact.fromJson(e);
              return CallHistoryItem(contact: contact);
            }).toList(),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                "OLDER",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ...allContacts.sublist(30, 55).map((e) {
              Contact contact = Contact.fromJson(e);
              return CallHistoryItem(contact: contact);
            }).toList(),
          ],
        ),
      ),
    );
  }
}
