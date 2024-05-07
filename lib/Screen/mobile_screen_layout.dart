
import 'package:flutter/material.dart';
import 'package:linkwave/Widgets/contacts_list.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title:const Text(
            'LINK-WAVE',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),


          ),
          actions: [
            IconButton(onPressed: () {}, icon:const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon:const Icon(Icons.more_vert))

          ],
          bottom:const TabBar(
            labelColor: Colors.black,
            indicatorWeight: 5,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold
            ),
            tabs: [
              Tab(text: 'CHATS',),
              Tab(text: 'STORIES',),
              Tab(text: 'CALLS',),
              Tab(text: 'POSTS',),
            ]
            ),
        ),
        body:const ContactsList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue,
          child: Icon(Icons.comment),
          ),
      ),
      );
  }
}