import 'package:flutter/material.dart';
import 'package:linkwave/Widgets/chat_list.dart';
import 'package:linkwave/Widgets/contacts_list.dart';
import 'package:linkwave/Widgets/web_chat_appbar.dart';
import 'package:linkwave/Widgets/web_profile_bar.dart';
import 'package:linkwave/Widgets/web_search_bar.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  WebProfileBar(),
                  WebSearchBar(),
                  ContactsList()
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.75,
            decoration:const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/1600w-Au-YPd-_ZqA.png'),
                fit: BoxFit.cover
                )
            ),
            child: Column(
              children: [
                WebChatAppBar(),
                Expanded(
                  child: ChatList()
                  ),
                Container(
                  height: MediaQuery.of(context).size.height*0.07,
                  padding:const EdgeInsets.all(10),
                  decoration:const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black
                      ),
                    ),
                    color: Colors.white,

                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {}, 
                        icon:const Icon(
                          Icons.emoji_emotions_outlined,
                          color: Colors.black,
                          ),
                          ),
                          IconButton(
                        onPressed: () {}, 
                        icon:const Icon(
                          Icons.attach_file,
                          color: Colors.black,
                          ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:const EdgeInsets.only(
                                left: 10,
                                right: 15,
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  fillColor: Colors.grey,
                                  filled: true,
                                  hintText: 'Enter the message.',
                                  border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:const BorderSide(
                width: 0,
                style: BorderStyle.none
              ),
            ),
            contentPadding:const EdgeInsets.only(left: 20)
                                ),
                              ),
                              ),
                            ),
                            IconButton(
                        onPressed: () {}, 
                        icon:const Icon(
                          Icons.mic,
                          color: Colors.black,
                          ),
                          ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}