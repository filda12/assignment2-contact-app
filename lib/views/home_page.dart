import 'package:contact_app/views/all_contacts.dart';
import 'package:contact_app/views/favourite_contacts.dart';
import 'package:contact_app/views/recent_calls.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
              hintText: 'Search Contacts',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: const Icon(Icons.mic_outlined),
              contentPadding: const EdgeInsets.all(2),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(100),
              ),
              filled: true,
              fillColor: Colors.blueGrey.withOpacity(0.15),
              isDense: true,
              constraints: const BoxConstraints(maxHeight: 35)),
        ),
        actions: const [
          Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
          SizedBox(width: 16)
        ],
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: currentIndex,
        children: const [
          RecentCalls(),
          AllContacts(),
          FavouriteContacts(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_filled),
            label: "Recents",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Contacts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "My favourites",
          ),
        ],
        onTap: (selectedIndex) => setState(() {
          currentIndex = selectedIndex;
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.dialpad),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
