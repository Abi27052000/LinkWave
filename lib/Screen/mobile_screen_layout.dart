import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linkwave/common/utills/utills.dart';
import 'package:linkwave/features/auth/controller/auth_controller.dart';
import 'package:linkwave/features/chat/widgets/contacts_list.dart';
import 'package:linkwave/features/post/screens/post_screen.dart';
import 'package:linkwave/features/select_contacts/screens/select_contacts_screen.dart';
import 'package:linkwave/features/status/screens/confirm_status_screen.dart';
import 'package:linkwave/features/status/screens/status_contact_screen.dart';

class MobileScreenLayout extends ConsumerStatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  ConsumerState<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends ConsumerState<MobileScreenLayout>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  late TabController tabBarController;
  @override
  void initState() {
    super.initState();
    tabBarController = TabController(length: 4, vsync: this);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        ref.read(authControllerProvider).setUserState(true);
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      case AppLifecycleState.paused:
      case AppLifecycleState.hidden:
        ref.read(authControllerProvider).setUserState(false);
        break;
    }
  }

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
          bottom: TabBar(
              controller: tabBarController,
              labelColor: Colors.black,
              indicatorWeight: 5,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              tabs: const [
                Tab(
                  text: 'CHATS',
                ),
                Tab(
                  text: 'STORIES',
                ),
                Tab(
                  text: 'USER PROFILE',
                ),
                Tab(
                  text: 'POSTS',
                ),
              ]),
        ),
        body: TabBarView(
          controller: tabBarController,
          children: const [
            ContactsList(),
            StatusContactsScreen(),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Profile Picture",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        SizedBox(height: 20),
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage("assets/abi.jpg"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),

                  // Username Section
                  Card(
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Username",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Abi",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Phone Number Section
                  Card(
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Phone Number",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "+94 0701465243",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Date Created Section
                  Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Date Created",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "23-05-2024",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            PostScreen(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (tabBarController.index == 0) {
              Navigator.pushNamed(context, SelectContactScreen.routeName);
            } else {
              File? pickedImage = await pickImageFromGallery(context);
              if (pickedImage != null) {
                Navigator.pushNamed(
                  context,
                  ConfirmStatusScreen.routeName,
                  arguments: pickedImage,
                );
              }
            }
          },
          backgroundColor: Colors.blue,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
