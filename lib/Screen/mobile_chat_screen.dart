import 'package:flutter/material.dart';
import 'package:linkwave/Widgets/chat_list.dart';
import 'package:linkwave/info.dart';

class MobileChatScreen extends StatelessWidget {
  const MobileChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          info[0]['name'].toString(),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {}, 
            icon:const Icon(Icons.video_call),
            ),
            IconButton(
            onPressed: () {}, 
            icon:const Icon(Icons.call),
            ),
            IconButton(
            onPressed: () {}, 
            icon:const Icon(Icons.more_vert),
            )
        ],
      ),
      body: Column(
        children: [
      const    Expanded(
            child: ChatList(),
            ),
            TextField(
              decoration: InputDecoration(

                filled: true,
                fillColor: Colors.grey,
                prefixIcon:const  Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Icon(Icons.emoji_emotions,color: Colors.black,),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.camera_alt,color: Colors.black,),
                        Icon(Icons.attach_file,color: Colors.black,),
                        Icon(Icons.money,color: Colors.black,),
                      ],
                    ),
                    ),
                    hintText: 'Enter the message.',
                    
                    border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:const BorderSide(
                width: 0,
                style: BorderStyle.none
              ),
            ),
            contentPadding:const EdgeInsets.all(10)
              ),
            )
        ],
        
      ),
    );
  }
}