import 'package:flutter/material.dart';
import 'package:linkwave/features/chat/widgets/contacts_list.dart';
import 'package:linkwave/features/select_contacts/screens/select_contacts_screen.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'LINK-WAVE',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
          bottom: const TabBar(
              labelColor: Colors.black,
              indicatorWeight: 5,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              tabs: [
                Tab(
                  text: 'CHATS',
                ),
                Tab(
                  text: 'STORIES',
                ),
                Tab(
                  text: 'CALLS',
                ),
                Tab(
                  text: 'POSTS',
                ),
              ]),
        ),
        body: const ContactsList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, SelectContactScreen.routeName);
          },
          backgroundColor: Colors.blue,
          child: Icon(Icons.comment),
        ),
      ),
    );
  }
}
