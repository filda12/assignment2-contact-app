import 'dart:math';

import 'package:contact_app/data/contacts_json.dart';
import 'package:contact_app/models/contact.dart';
import 'package:flutter/material.dart';

class CallHistoryItem extends StatelessWidget {
  const CallHistoryItem({
    Key? key,
    required this.contact,
  }) : super(key: key);

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    int randomNumber = Random().nextInt(10);
    bool incoming = randomNumber % 2 == 0;

    return ListTile(
      leading: CircleAvatar(
        child: Text(contact.firstName[0]),
        backgroundColor: randomColors[randomNumber],
      ),
      title: Text("${contact.firstName} ${contact.lastName}"),
      subtitle: Row(
        children: [
          Icon(
            Icons.sim_card_outlined,
            size: 16,
            color: incoming ? Colors.blue : Colors.green,
          ),
          Icon(
            incoming ? Icons.arrow_downward : Icons.arrow_upward,
            size: 16,
            color: incoming ? Colors.blue : Colors.green,
          ),
          const Text("Mobile")
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("${randomNumber + 1} hr ago"),
          const SizedBox(width: 10),
          const Icon(
            Icons.info_outline,
            size: 16,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
