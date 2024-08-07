import 'package:flutter/material.dart';

class WebProfileBar extends StatelessWidget {
  const WebProfileBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height * 0.077,
      width: MediaQuery.of(context).size.width * 0.25,
      padding:const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Colors.black
          )

        ),
        color: Colors.grey
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage('https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60'),
            radius: 20,
          ),
          Row(
            children: [
              IconButton(
              onPressed: () {}, 
              icon: const Icon(Icons.comment,
              color: Colors.black,
              ),
              ),
              IconButton(
          onPressed: () {}, 
          icon: const Icon(Icons.more_vert,
          color: Colors.black,
          ),
          ),
            ],
          ),
          
        ],
      ),


    );
  }
}